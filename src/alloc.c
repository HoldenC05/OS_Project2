#include "alloc.h"

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define ALIGNMENT 16 /**< The alignment of the memory blocks */
#define MAGIC_NUMBER 0x0512ABCD


static free_block *HEAD = NULL; /**< Pointer to the first element of the free list */
static free_block *LAST_ALLOC = NULL; /**< Pointer to the last allocated block */

/**
 * Split a free block into two blocks
 *
 * @param block The block to split
 * @param size The size of the first new split block
 * @return A pointer to the first block or NULL if the block cannot be split
 */
void *split(free_block *block, int size) {
    if((block->size < size + sizeof(free_block))) {
    return NULL;
    }

    void *split_pnt = (char *)block + size + sizeof(free_block);
    free_block *new_block = (free_block *) split_pnt;

    new_block->size = block->size - size - sizeof(free_block);
    new_block->next = block->next;

    block->size = size;

    return block;
}


/**
 * Find the previous neighbor of a block
 *
 * @param block The block to find the previous neighbor of
 * @return A pointer to the previous neighbor or NULL if there is none
 */
free_block *find_prev(free_block *block) {
    free_block *curr = HEAD;
    while(curr != NULL) {
        char *next = (char *)curr + curr->size + sizeof(free_block);
        if(next == (char *)block)
            return curr;
        curr = curr->next;
    }
    return NULL;
}

/**
 * Find the next neighbor of a block
 *
 * @param block The block to find the next neighbor of
 * @return A pointer to the next neighbor or NULL if there is none
 */
free_block *find_next(free_block *block) {
    char *block_end = (char*)block + block->size + sizeof(free_block);
    free_block *curr = HEAD;

    while(curr != NULL) {
        if((char *)curr == block_end)
            return curr;
        curr = curr->next;
    }
    return NULL;
}

/**
 * Remove a block from the free list
 *
 * @param block The block to remove
 */
void remove_free_block(free_block *block) {
    free_block *curr = HEAD;
    if(curr == block) {
        HEAD = block->next;
        return;
    }
    while(curr != NULL) {
        if(curr->next == block) {
            curr->next = block->next;
            return;
        }
        curr = curr->next;
    }
}

/**
 * Coalesce neighboring free blocks
 *
 * @param block The block to coalesce
 * @return A pointer to the first block of the coalesced blocks
 */
void *coalesce(free_block *block) {
    if (block == NULL) {
        return NULL;
    }

    free_block *prev = find_prev(block);
    free_block *next = find_next(block);

    // Coalesce with previous block if it is contiguous.
    if (prev != NULL) {
        char *end_of_prev = (char *)prev + prev->size + sizeof(free_block);
        if (end_of_prev == (char *)block) {
            prev->size += block->size + sizeof(free_block);

            // Ensure prev->next is updated to skip over 'block', only if 'block' is directly next to 'prev'.
            if (prev->next == block) {
                prev->next = block->next;
            }
            block = prev; // Update block to point to the new coalesced block.
        }
    }

    // Coalesce with next block if it is contiguous.
    if (next != NULL) {
        char *end_of_block = (char *)block + block->size + sizeof(free_block);
        if (end_of_block == (char *)next) {
            block->size += next->size + sizeof(free_block);

            // Ensure block->next is updated to skip over 'next'.
            block->next = next->next;
        }
    }

    return block;
}

/**
 * Search for a free block using the next-fit strategy
 *
 * @param size The size of the block to search for
 */
void *next_fit_search (size_t size) {
    printf("Starting next_fit_search\n");
    if (HEAD == NULL) {
        return NULL;
    }
    free_block *curr = NULL;
    // If LAST_ALLOC is not NULL, start from there
    // Otherwise, start from the HEAD of the free list
    if (LAST_ALLOC != NULL){
        curr = LAST_ALLOC;
     }
     else {
        curr = HEAD;
     }
    
    while (curr != NULL) {
        if (curr->size >= size) {
            // Check if the block can be split
            void *split_block = split(curr, size);
            if (split_block != NULL) {
                // If it can be split, remove the block from the free list
                remove_free_block(curr);
                free_block *remainder = (free_block*)((char*)split_block + size + sizeof(free_block));    
                remainder->next = HEAD;
                HEAD = remainder;
                
                LAST_ALLOC = (free_block*)split_block;
                return split_block;
            } else {
                // If it can't be split, just remove it from the free list
                remove_free_block(curr);
                LAST_ALLOC = curr;
                return curr;
            }
        }
        curr = curr->next;
        if (curr == HEAD) {
            curr = NULL; // We have looped through the entire list
        
        if (curr == LAST_ALLOC) {
            break; // We have looped through the entire list, Because we checked LAST_ALLOC at the begining, we don't have to do it again
        }
    }

return NULL;
 }
}
/**
 * Call sbrk to get memory from the OS
 *
 * @param size The amount of memory to allocate
 * @return A pointer to the allocated memory
 */

void *do_alloc(size_t size) {
    printf("Starting doalloc)");
    void *start = sbrk(0);
    uintptr_t addr = (uintptr_t)start;
    size_t misalignment = addr % ALIGNMENT;
    size_t alignment_correction = 0;
    if (misalignment != 0) {
        alignment_correction += ALIGNMENT - misalignment;
    }

    if (sbrk(size + sizeof(header) + alignment_correction) == (void*)-1) {
        return NULL;
    }

    // Set the header
    header *hdr = (header *)(addr + alignment_correction);
    hdr->size = size;
    hdr->magic = MAGIC_NUMBER;

    return (void*)(addr + alignment_correction + (sizeof(header)));
}

/**
 * Allocates memory for the end user
 *
 * @param size The amount of memory to allocate
 * @return A pointer to the requested block of memory
 */
void *tumalloc(size_t size) {
    printf("Starting tumalloc\n");
    if (size == 0) {
        return NULL;
    }

    size_t true_size = size + sizeof(header);
    void *ptr = next_fit_search(true_size);
    if (ptr != NULL) {

        //init header
        header *hdr = (header *)(ptr);
        hdr->size = size;
        hdr->magic = MAGIC_NUMBER;

        //return the pointer after the header
        return (void*)((char*)(ptr) + sizeof(header));
    }
    else {
        return (do_alloc(size));
    }

    return NULL;
}

/**
 * Allocates and initializes a list of elements for the end user
 *
 * @param num How many elements to allocate
 * @param size The size of each element
 * @return A pointer to the requested block of initialized memory
 */
void *tucalloc(size_t num, size_t size) {
    printf("Starting tucalloc\n");
    if (num == 0 || size == 0) {
        return NULL;
    }
    size_t true_size = num * size + sizeof(header);
    return tumalloc(true_size);
}

/**
 * Reallocates a chunk of memory with a bigger size
 *
 * @param ptr A pointer to an already allocated piece of memory
 * @param new_size The new requested size to allocate
 * @return A new pointer containing the contents of ptr, but with the new_size
 */
void *turealloc(void *ptr, size_t new_size) {
    printf("Starting turealloc\n");
    if (ptr == NULL) {
        return tumalloc(new_size);
    }
    if (new_size == 0) {
        tufree(ptr);
        return NULL;
    }
    header *hdr = (header*)((char*)ptr-sizeof(header));
    if (hdr->magic != MAGIC_NUMBER) {
        printf("your magic number is not so magic\n");
        return NULL;
    }
    size_t old_size = hdr->size;
    if (new_size <= old_size) {
        return ptr;
    }
    void *new_ptr = tumalloc(new_size);
    if (new_ptr == NULL) {
        return NULL;
    }
    memcpy(new_ptr, ptr, old_size);
    tufree(ptr);
    return new_ptr;
}

/**
 * Removes used chunk of memory and returns it to the free list
 *
 * @param ptr Pointer to the allocated piece of memory
 */
void tufree(void *ptr) {
    if (ptr == NULL) {
        return;
    }

    header *hdr = (header*)((char*)ptr-sizeof(header));
    if (hdr->magic != MAGIC_NUMBER) {
        printf("your magic number is not so magic\n");
        return;
    }

    free_block *block = (free_block*)hdr;
    block->size = hdr->size;
    block->next = HEAD;
    HEAD = block;
    block = coalesce(block);

}

## Holden Notes
### Project Goals
- do_alloc:
    * Does the actual allocation, No matter whether calloc or malloc
- tumalloc:
    * Malloc allocation however much is needed... just one item not really a list
    * Size of requested memory, and returns the pointer to the block of memory
- tucalloc
    * Used for lists of items to allocate memory for that
    * Number of elements (num), Size of each element (size), and returns the pointer to the memory
- turealloc
    * Takes a chunk of memory and moves it to a new place because it is expanding it


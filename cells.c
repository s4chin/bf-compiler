#include <stdlib.h>
#include <stdio.h>

int main() {
    int *cells;
    // Allocate 30000 cells
    cells = (int*)calloc(30000, sizeof(int));
    printf("%d", cells[0]);
    
    int *cell_index_ptr;
    cell_index_ptr = 0;
    
    // BF code goes here
    
    // Free the cells
    free(cells);
    return 0;
}

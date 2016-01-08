#include <stdlib.h>
#include <stdio.h>

int main() {
    char *cells;
    // Allocate 30000 cells
    cells = (char*)calloc(30000, sizeof(char));
    printf("%d", cells[0]);
    
    char *cell_index_ptr;
    cell_index_ptr = 0;
    
    // BF code goes here
    char *cell_ptr = cells + 5;
    char current_value = *cell_ptr;
    char new_value = current_value + 1;
    *cell_ptr = new_value;    
    
    // Free the cells
    return *cell_ptr;
}

declare i8* @calloc(i32)
declare void @free(i8*)
declare i32 @putchar(i32)
declare i32 @getchar()

define i32 @main() {
    %cells = call i8* @calloc(i32 30000)
    %cell_index_ptr = alloca i32
    store i32 1, i32* %cell_index_ptr

    ; we implement the BF program '.'
    
    %cell_index = load i32* %cell_index_ptr
    %cell_ptr = getelementptr i8* %cells, i32 %cell_index
    
    store i8 70, i8* %cell_ptr
    %current_cell = load i8* %cell_ptr
    %current_cell_word = sext i8 %current_cell to i32
    call i32 @putchar(i32 %current_cell_word)
    
    ret i32 0
}

declare i8* @calloc(i32)
declare void @free(i8*)
declare i32 @putchar(i32)
declare i32 @getchar()

define i32 @main() {
    %cells = call i8* @calloc(i32 30000)
    %cell_index_ptr = alloca i32
    store i32 1, i32* %cell_index_ptr

    ; we implement the BF program ',.'
    
    %cell_ptr = getelementptr i8* %cells, i32 1
    
    %input_int = call i32 @getchar()
    %input_byte = trunc i32 %input_int to i8
    store i8 %input_byte, i8* %cell_ptr
    
    ; print the current cell
    %tmp = load i8* %cell_ptr
    %tmp2 = sext i8 %tmp to i32
    %1 = call i32 @putchar(i32 %tmp2)
    
    ret i32 0
}

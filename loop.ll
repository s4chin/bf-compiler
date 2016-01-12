declare i8* @calloc(i32)
declare void @free(i8*)
declare i32 @putchar(i32)
declare i32 @getchar()

define i32 @main() {
    %cells = call i8* @calloc(i32 30000)
    %cell_index_ptr = alloca i32
    store i32 1, i32* %cell_index_ptr

    ; we implement the BF program '[-]'
    br label %loop_header
    
loop_header:
    %cell_index = load i32* %cell_index_ptr
    %cell_ptr = getelementptr i8* %cells, i32 %cell_index
    %cell_value = load i8* %cell_ptr
    %is_zero = icmp eq i8 %cell_value, 0
    br i1 %is_zero, label %loop_after, label %loop_body

loop_body:
    ; x
    %tmp = load i8* %cell_ptr
    %tmp2 = add i8 %tmp, 1
    store i8 %tmp2, i8* %cell_ptr
    
    br label %loop_header

loop_after:
    ; y
    %exit_code_byte = load i8* %cell_ptr
    %exit_code = zext i8 %exit_code_byte to i32
    
    call void @free(i8* %cells)
    
    ret i32 %exit_code
}

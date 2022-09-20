declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %b = add i64 1, 2
  %temp1 = bitcast i64 %b to i64
  %a = add i64 1, %temp1
  %result = add i64 %a, %b
  ret i64 %result
}

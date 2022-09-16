declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %result$1 = bitcast i64 42 to i64
  %temp1$2 = bitcast i64 %result$1 to i64
  ret i64 %result$1
}

declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %result = bitcast i64 42 to i64
  ret i64 %result
}

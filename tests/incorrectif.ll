declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %temp1 = trunc i64 1 to i1
  br i1 %temp1, label %label1, label %label2
label1:
  %a = bitcast i64 1 to i64
  br label %label2
label2:
  %a = bitcast i64 2 to i64
  %result = bitcast i64 %a to i64
  ret i64 %result
}

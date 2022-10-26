declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %result = bitcast i64 97 to i64
  br label %label1
label1:
  %temp4 = bitcast i64 %result to i64
  %temp5 = bitcast i64 122 to i64
  %temp3 = icmp slt i64 %temp4, %temp5
  br i1 %temp3, label %label2, label %label3
label2:
  %temp2 = bitcast i64 %result to i64
  %temp1 = add i64 %temp2, 1
  %result = bitcast i64 %temp1 to i64
  br label %label1
label3:
  ret i64 %result
}

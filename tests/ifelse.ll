declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %result = bitcast i64 0 to i64
  %temp2 = icmp slt i64 2, 1
  br i1 %temp2, label %label1, label %label2
label1:
  %temp1 = icmp slt i64 1, 2
  br i1 %temp1, label %label3, label %label4
label3:
  %result = bitcast i64 1 to i64
  br label %label5
label4:
  %result = bitcast i64 2 to i64
  br label %label5
label5:
  br label %label2
label2:
  ret i64 %result
}

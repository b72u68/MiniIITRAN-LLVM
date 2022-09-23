declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %result = bitcast i64 0 to i64
  %temp3 = icmp slt i64 2, 1
  br i1 %temp3, label %label1, label %label2
label1:
  br label %label3
label3:
  %temp2 = trunc i64 1 to i1
  br i1 %temp2, label %label4, label %label5
label4:
  %temp1 = icmp slt i64 1, 2
  br i1 %temp1, label %label6, label %label7
label6:
  %result = bitcast i64 1 to i64
  br label %label8
label7:
  %result = bitcast i64 2 to i64
  br label %label8
label8:
  br label %label3
label5:
  br label %label2
label2:
  ret i64 %result
}

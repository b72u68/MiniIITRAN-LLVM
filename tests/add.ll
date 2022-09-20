declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %i = bitcast i64 0 to i64
  %result = bitcast i64 0 to i64
  br label %label1
label1:
  %temp3 = icmp sle i64 %i, 10
  br i1 %temp3, label %label4, label %label6
label6:
  %temp2 = icmp slt i64 1, 0
  br i1 %temp2, label %label4, label %label5
label4:
  %temp1 = bitcast i1 1 to i1
  br label %label7
label5:
  %temp1 = bitcast i1 0 to i1
  br label %label7
label7:
  br i1 %temp1, label %label2, label %label3
label2:
  %result = add i64 %result, %i
  %i = add i64 %i, 1
  br label %label1
label3:
  ret i64 %result
  ret i64 %result
}

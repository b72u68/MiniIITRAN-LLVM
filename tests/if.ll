declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %temp5 = add i64 1, 1
  %temp4 = icmp eq i64 %temp5, 2
  br i1 %temp4, label %label6, label %label5
label6:
  %temp3 = add i64 1, 2
  %temp2 = icmp eq i64 %temp3, 3
  br i1 %temp2, label %label4, label %label5
label4:
  %temp1 = bitcast i1 1 to i1
  br label %label7
label5:
  %temp1 = bitcast i1 0 to i1
  br label %label7
label7:
  br i1 %temp1, label %label1, label %label2
label1:
  %result = bitcast i64 1 to i64
  br label %label3
label2:
  %result = bitcast i64 2 to i64
  br label %label3
label3:
  ret i64 %result
}

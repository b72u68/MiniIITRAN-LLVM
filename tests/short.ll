declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %temp3 = icmp slt i64 12, 30
  br i1 %temp3, label %label1, label %label3
label3:
  %temp2 = sdiv i64 1, 0
  %temp1 = icmp slt i64 %temp2, 0
  br i1 %temp1, label %label1, label %label2
label1:
  %a = bitcast i1 1 to i1
  br label %label4
label2:
  %a = bitcast i1 0 to i1
  br label %label4
label4:
  %temp6 = icmp sgt i64 1, 40
  br i1 %temp6, label %label7, label %label6
label7:
  %temp5 = sdiv i64 1, 0
  %temp4 = icmp slt i64 %temp5, 0
  br i1 %temp4, label %label5, label %label6
label5:
  %b = bitcast i1 1 to i1
  br label %label8
label6:
  %b = bitcast i1 0 to i1
  br label %label8
label8:
  %temp10 = bitcast i1 %a to i1
  br i1 %temp10, label %label11, label %label10
label11:
  %temp9 = bitcast i1 %b to i1
  %temp8 = xor i1 %temp9, 1
  br i1 %temp8, label %label9, label %label10
label9:
  %temp7 = bitcast i1 1 to i1
  br label %label12
label10:
  %temp7 = bitcast i1 0 to i1
  br label %label12
label12:
  %result = zext i1 %temp7 to i64
  ret i64 %result
}

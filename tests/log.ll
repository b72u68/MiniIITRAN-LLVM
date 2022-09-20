declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %a = icmp slt i64 12, 30
  %b = icmp sgt i64 1, 40
  %c = icmp ne i64 1, 2
  %temp2 = bitcast i1 %a to i1
  br i1 %temp2, label %label3, label %label2
label3:
  %temp1 = bitcast i1 %b to i1
  br i1 %temp1, label %label1, label %label2
label1:
  %d = bitcast i1 1 to i1
  br label %label4
label2:
  %d = bitcast i1 0 to i1
  br label %label4
label4:
  %temp5 = bitcast i1 %a to i1
  br i1 %temp5, label %label7, label %label6
label7:
  %temp4 = bitcast i1 %b to i1
  %temp3 = xor i1 %temp4, 1
  br i1 %temp3, label %label5, label %label6
label5:
  %e = bitcast i1 1 to i1
  br label %label8
label6:
  %e = bitcast i1 0 to i1
  br label %label8
label8:
  %temp8 = bitcast i1 %d to i1
  br i1 %temp8, label %label9, label %label11
label11:
  %temp7 = bitcast i1 %e to i1
  br i1 %temp7, label %label9, label %label10
label9:
  %temp6 = bitcast i1 1 to i1
  br label %label12
label10:
  %temp6 = bitcast i1 0 to i1
  br label %label12
label12:
  %result = zext i1 %temp6 to i64
  ret i64 %result
}

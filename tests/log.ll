declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %a = icmp slt i64 12, 30
  %b = icmp sgt i64 1, 40
  %c = icmp ne i64 1, 2
  br i1 %a, label %label3, label %label2
label3:
  br i1 %b, label %label1, label %label2
label1:
  %d = bitcast i1 1 to i1
  br label %label4
label2:
  %d = bitcast i1 0 to i1
  br label %label4
label4:
  br i1 %a, label %label7, label %label6
label7:
  %temp1 = xor i1 %b, 1
  br i1 %temp1, label %label5, label %label6
label5:
  %e = bitcast i1 1 to i1
  br label %label8
label6:
  %e = bitcast i1 0 to i1
  br label %label8
label8:
  br i1 %d, label %label9, label %label11
label11:
  br i1 %e, label %label9, label %label10
label9:
  %temp2 = bitcast i1 1 to i1
  br label %label12
label10:
  %temp2 = bitcast i1 0 to i1
  br label %label12
label12:
  %result = zext i1 %temp2 to i64
  ret i64 %result
}

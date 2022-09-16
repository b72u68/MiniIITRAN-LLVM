declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %temp8$1 = bitcast i64 12 to i64
  %temp9$2 = bitcast i64 30 to i64
  %temp7$3 = icmp slt i64 %temp8$1, %temp9$2
  br i1 %temp7$3, label %label1, label %label3
label1:
  %temp6$51 = phi i64 [%temp6$48, %label3], [0, %main__entry]
  %temp5$52 = phi i64 [%temp5$46, %label3], [0, %main__entry]
  %temp4$53 = phi i64 [%temp4$45, %label3], [0, %main__entry]
  %temp3$54 = phi i64 [%temp3$47, %label3], [0, %main__entry]
  %temp2$55 = phi i1 [%temp2$49, %label3], [0, %main__entry]
  %a$56 = bitcast i1 1 to i1
  br label %label4
label10:
  %temp22$30 = phi i1 [%temp22$27, %label11], [0, %label8]
  %temp21$31 = phi i1 [%temp21$28, %label11], [0, %label8]
  %temp20$32 = bitcast i1 0 to i1
  br label %label12
label11:
  %temp22$27 = bitcast i1 %b$19 to i1
  %temp21$28 = xor i1 %temp22$27, 1
  br i1 %temp21$28, label %label9, label %label10
label12:
  %temp22$22 = phi i1 [%temp22$30, %label10], [%temp22$27, %label9]
  %temp21$23 = phi i1 [%temp21$31, %label10], [%temp21$28, %label9]
  %temp20$24 = phi i1 [%temp20$32, %label10], [%temp20$29, %label9]
  %result$25 = zext i1 %temp20$24 to i64
  %temp19$26 = bitcast i64 %result$25 to i64
  ret i64 %result$25
label2:
  %a$50 = bitcast i1 0 to i1
  br label %label4
label3:
  %temp4$45 = bitcast i64 1 to i64
  %temp5$46 = bitcast i64 0 to i64
  %temp3$47 = sdiv i64 %temp4$45, %temp5$46
  %temp6$48 = bitcast i64 0 to i64
  %temp2$49 = icmp slt i64 %temp3$47, %temp6$48
  br i1 %temp2$49, label %label1, label %label2
label4:
  %temp6$4 = phi i64 [%temp6$51, %label1], [%temp6$48, %label2]
  %temp5$5 = phi i64 [%temp5$52, %label1], [%temp5$46, %label2]
  %temp4$6 = phi i64 [%temp4$53, %label1], [%temp4$45, %label2]
  %temp3$7 = phi i64 [%temp3$54, %label1], [%temp3$47, %label2]
  %temp2$8 = phi i1 [%temp2$55, %label1], [%temp2$49, %label2]
  %a$9 = phi i1 [%a$56, %label1], [%a$50, %label2]
  %temp1$10 = bitcast i1 %a$9 to i1
  %temp17$11 = bitcast i64 1 to i64
  %temp18$12 = bitcast i64 40 to i64
  %temp16$13 = icmp sgt i64 %temp17$11, %temp18$12
  br i1 %temp16$13, label %label7, label %label6
label5:
  %b$38 = bitcast i1 1 to i1
  br label %label8
label6:
  %temp15$39 = phi i64 [%temp15$36, %label7], [0, %label4]
  %temp14$40 = phi i64 [%temp14$34, %label7], [0, %label4]
  %temp13$41 = phi i64 [%temp13$33, %label7], [0, %label4]
  %temp12$42 = phi i64 [%temp12$35, %label7], [0, %label4]
  %temp11$43 = phi i1 [%temp11$37, %label7], [0, %label4]
  %b$44 = bitcast i1 0 to i1
  br label %label8
label7:
  %temp13$33 = bitcast i64 1 to i64
  %temp14$34 = bitcast i64 0 to i64
  %temp12$35 = sdiv i64 %temp13$33, %temp14$34
  %temp15$36 = bitcast i64 0 to i64
  %temp11$37 = icmp slt i64 %temp12$35, %temp15$36
  br i1 %temp11$37, label %label5, label %label6
label8:
  %temp15$14 = phi i64 [%temp15$39, %label6], [%temp15$36, %label5]
  %temp14$15 = phi i64 [%temp14$40, %label6], [%temp14$34, %label5]
  %temp13$16 = phi i64 [%temp13$41, %label6], [%temp13$33, %label5]
  %temp12$17 = phi i64 [%temp12$42, %label6], [%temp12$35, %label5]
  %temp11$18 = phi i1 [%temp11$43, %label6], [%temp11$37, %label5]
  %b$19 = phi i1 [%b$44, %label6], [%b$38, %label5]
  %temp10$20 = bitcast i1 %b$19 to i1
  %temp23$21 = bitcast i1 %a$9 to i1
  br i1 %temp23$21, label %label11, label %label10
label9:
  %temp20$29 = bitcast i1 1 to i1
  br label %label12
}

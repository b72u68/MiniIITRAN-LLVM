declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %temp2$1 = bitcast i64 12 to i64
  %temp3$2 = bitcast i64 30 to i64
  %a$3 = icmp slt i64 %temp2$1, %temp3$2
  %temp1$4 = bitcast i1 %a$3 to i1
  %temp5$5 = bitcast i64 1 to i64
  %temp6$6 = bitcast i64 40 to i64
  %b$7 = icmp sgt i64 %temp5$5, %temp6$6
  %temp4$8 = bitcast i1 %b$7 to i1
  %temp8$9 = bitcast i64 1 to i64
  %temp9$10 = bitcast i64 2 to i64
  %c$11 = icmp ne i64 %temp8$9, %temp9$10
  %temp7$12 = bitcast i1 %c$11 to i1
  %temp12$13 = bitcast i1 %a$3 to i1
  br i1 %temp12$13, label %label3, label %label2
label1:
  %d$38 = bitcast i1 1 to i1
  br label %label4
label10:
  %temp18$30 = bitcast i1 0 to i1
  br label %label12
label11:
  %temp19$29 = bitcast i1 %e$20 to i1
  br i1 %temp19$29, label %label9, label %label10
label12:
  %temp19$25 = phi i1 [%temp19$29, %label10], [%temp19$23, %label9]
  %temp18$26 = phi i1 [%temp18$30, %label10], [%temp18$24, %label9]
  %result$27 = zext i1 %temp18$26 to i64
  %temp17$28 = bitcast i64 %result$27 to i64
  ret i64 %result$27
label2:
  %temp11$39 = phi i1 [%temp11$37, %label3], [0, %main__entry]
  %d$40 = bitcast i1 0 to i1
  br label %label4
label3:
  %temp11$37 = bitcast i1 %b$7 to i1
  br i1 %temp11$37, label %label1, label %label2
label4:
  %temp11$14 = phi i1 [%temp11$39, %label2], [%temp11$37, %label1]
  %d$15 = phi i1 [%d$40, %label2], [%d$38, %label1]
  %temp10$16 = bitcast i1 %d$15 to i1
  %temp16$17 = bitcast i1 %a$3 to i1
  br i1 %temp16$17, label %label7, label %label6
label5:
  %e$33 = bitcast i1 1 to i1
  br label %label8
label6:
  %temp15$34 = phi i1 [%temp15$31, %label7], [0, %label4]
  %temp14$35 = phi i1 [%temp14$32, %label7], [0, %label4]
  %e$36 = bitcast i1 0 to i1
  br label %label8
label7:
  %temp15$31 = bitcast i1 %b$7 to i1
  %temp14$32 = xor i1 %temp15$31, 1
  br i1 %temp14$32, label %label5, label %label6
label8:
  %temp15$18 = phi i1 [%temp15$34, %label6], [%temp15$31, %label5]
  %temp14$19 = phi i1 [%temp14$35, %label6], [%temp14$32, %label5]
  %e$20 = phi i1 [%e$36, %label6], [%e$33, %label5]
  %temp13$21 = bitcast i1 %e$20 to i1
  %temp20$22 = bitcast i1 %d$15 to i1
  br i1 %temp20$22, label %label9, label %label11
label9:
  %temp19$23 = phi i1 [%temp19$29, %label11], [0, %label8]
  %temp18$24 = bitcast i1 1 to i1
  br label %label12
}

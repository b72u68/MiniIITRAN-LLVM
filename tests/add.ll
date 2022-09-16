declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %i$1 = bitcast i64 0 to i64
  %temp1$2 = bitcast i64 %i$1 to i64
  %result$3 = bitcast i64 0 to i64
  %temp2$4 = bitcast i64 %result$3 to i64
  br label %label1
label1:
  %temp9$5 = phi i1 [%temp9$20, %label2], [0, %main__entry]
  %temp8$6 = phi i64 [%temp8$29, %label2], [0, %main__entry]
  %temp7$7 = phi i64 [%temp7$28, %label2], [0, %main__entry]
  %temp6$8 = phi i64 [%temp6$31, %label2], [0, %main__entry]
  %temp5$9 = phi i64 [%temp5$25, %label2], [0, %main__entry]
  %temp4$10 = phi i64 [%temp4$24, %label2], [0, %main__entry]
  %temp3$11 = phi i64 [%temp3$27, %label2], [0, %main__entry]
  %temp12$12 = phi i64 [%temp12$21, %label2], [0, %main__entry]
  %temp11$13 = phi i64 [%temp11$22, %label2], [0, %main__entry]
  %temp10$14 = phi i1 [%temp10$23, %label2], [0, %main__entry]
  %result$15 = phi i64 [%result$26, %label2], [%result$3, %main__entry]
  %i$16 = phi i64 [%i$30, %label2], [%i$1, %main__entry]
  %temp14$17 = bitcast i64 %i$16 to i64
  %temp15$18 = bitcast i64 10 to i64
  %temp13$19 = icmp sle i64 %temp14$17, %temp15$18
  br i1 %temp13$19, label %label4, label %label6
label2:
  %temp4$24 = bitcast i64 %result$15 to i64
  %temp5$25 = bitcast i64 %i$16 to i64
  %result$26 = add i64 %temp4$24, %temp5$25
  %temp3$27 = bitcast i64 %result$26 to i64
  %temp7$28 = bitcast i64 %i$16 to i64
  %temp8$29 = bitcast i64 1 to i64
  %i$30 = add i64 %temp7$28, %temp8$29
  %temp6$31 = bitcast i64 %i$30 to i64
  br label %label1
label3:
  ret i64 %result$15
  ret i64 %result$15
label4:
  %temp12$36 = phi i64 [%temp12$33, %label6], [%temp12$12, %label1]
  %temp11$37 = phi i64 [%temp11$32, %label6], [%temp11$13, %label1]
  %temp10$38 = phi i1 [%temp10$34, %label6], [%temp10$14, %label1]
  %temp9$39 = bitcast i1 1 to i1
  br label %label7
label5:
  %temp9$35 = bitcast i1 0 to i1
  br label %label7
label6:
  %temp11$32 = bitcast i64 1 to i64
  %temp12$33 = bitcast i64 0 to i64
  %temp10$34 = icmp slt i64 %temp11$32, %temp12$33
  br i1 %temp10$34, label %label4, label %label5
label7:
  %temp9$20 = phi i1 [%temp9$39, %label4], [%temp9$35, %label5]
  %temp12$21 = phi i64 [%temp12$36, %label4], [%temp12$33, %label5]
  %temp11$22 = phi i64 [%temp11$37, %label4], [%temp11$32, %label5]
  %temp10$23 = phi i1 [%temp10$38, %label4], [%temp10$34, %label5]
  br i1 %temp9$20, label %label2, label %label3
}

declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %temp11$1 = bitcast i64 1 to i64
  %temp12$2 = bitcast i64 1 to i64
  %temp10$3 = add i64 %temp11$1, %temp12$2
  %temp13$4 = bitcast i64 2 to i64
  %temp9$5 = icmp eq i64 %temp10$3, %temp13$4
  br i1 %temp9$5, label %label6, label %label5
label1:
  %result$17 = bitcast i64 1 to i64
  %temp2$18 = bitcast i64 %result$17 to i64
  br label %label3
label2:
  %result$15 = bitcast i64 2 to i64
  %temp1$16 = bitcast i64 %result$15 to i64
  br label %label3
label3:
  %temp2$12 = phi i64 [%temp2$18, %label1], [0, %label2]
  %temp1$13 = phi i64 [0, %label1], [%temp1$16, %label2]
  %result$14 = phi i64 [%result$17, %label1], [%result$15, %label2]
  ret i64 %result$14
label4:
  %temp3$24 = bitcast i1 1 to i1
  br label %label7
label5:
  %temp8$25 = phi i64 [%temp8$22, %label6], [0, %main__entry]
  %temp7$26 = phi i64 [%temp7$20, %label6], [0, %main__entry]
  %temp6$27 = phi i64 [%temp6$19, %label6], [0, %main__entry]
  %temp5$28 = phi i64 [%temp5$21, %label6], [0, %main__entry]
  %temp4$29 = phi i1 [%temp4$23, %label6], [0, %main__entry]
  %temp3$30 = bitcast i1 0 to i1
  br label %label7
label6:
  %temp6$19 = bitcast i64 1 to i64
  %temp7$20 = bitcast i64 2 to i64
  %temp5$21 = add i64 %temp6$19, %temp7$20
  %temp8$22 = bitcast i64 3 to i64
  %temp4$23 = icmp eq i64 %temp5$21, %temp8$22
  br i1 %temp4$23, label %label4, label %label5
label7:
  %temp8$6 = phi i64 [%temp8$25, %label5], [%temp8$22, %label4]
  %temp7$7 = phi i64 [%temp7$26, %label5], [%temp7$20, %label4]
  %temp6$8 = phi i64 [%temp6$27, %label5], [%temp6$19, %label4]
  %temp5$9 = phi i64 [%temp5$28, %label5], [%temp5$21, %label4]
  %temp4$10 = phi i1 [%temp4$29, %label5], [%temp4$23, %label4]
  %temp3$11 = phi i1 [%temp3$30, %label5], [%temp3$24, %label4]
  br i1 %temp3$11, label %label1, label %label2
}

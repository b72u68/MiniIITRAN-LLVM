declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %result$1 = bitcast i64 0 to i64
  %temp1$2 = bitcast i64 %result$1 to i64
  %temp10$3 = bitcast i64 2 to i64
  %temp11$4 = bitcast i64 1 to i64
  %temp9$5 = icmp slt i64 %temp10$3, %temp11$4
  br i1 %temp9$5, label %label1, label %label2
label1:
  br label %label3
label2:
  %temp8$6 = phi i64 [%temp8$20, %label5], [0, %main__entry]
  %temp7$7 = phi i1 [%temp7$21, %label5], [0, %main__entry]
  %temp6$8 = phi i64 [%temp6$14, %label5], [0, %main__entry]
  %temp5$9 = phi i64 [%temp5$15, %label5], [0, %main__entry]
  %temp4$10 = phi i1 [%temp4$16, %label5], [0, %main__entry]
  %temp3$11 = phi i64 [%temp3$17, %label5], [0, %main__entry]
  %temp2$12 = phi i64 [%temp2$18, %label5], [0, %main__entry]
  %result$13 = phi i64 [%result$19, %label5], [%result$1, %main__entry]
  ret i64 %result$13
label3:
  %temp6$14 = phi i64 [%temp6$23, %label8], [0, %label1]
  %temp5$15 = phi i64 [%temp5$22, %label8], [0, %label1]
  %temp4$16 = phi i1 [%temp4$24, %label8], [0, %label1]
  %temp3$17 = phi i64 [%temp3$25, %label8], [0, %label1]
  %temp2$18 = phi i64 [%temp2$26, %label8], [0, %label1]
  %result$19 = phi i64 [%result$27, %label8], [%result$1, %label1]
  %temp8$20 = bitcast i64 1 to i64
  %temp7$21 = trunc i64 %temp8$20 to i1
  br i1 %temp7$21, label %label4, label %label5
label4:
  %temp5$22 = bitcast i64 1 to i64
  %temp6$23 = bitcast i64 2 to i64
  %temp4$24 = icmp slt i64 %temp5$22, %temp6$23
  br i1 %temp4$24, label %label6, label %label7
label5:
  br label %label2
label6:
  %result$30 = bitcast i64 1 to i64
  %temp3$31 = bitcast i64 %result$30 to i64
  br label %label8
label7:
  %result$28 = bitcast i64 2 to i64
  %temp2$29 = bitcast i64 %result$28 to i64
  br label %label8
label8:
  %temp3$25 = phi i64 [%temp3$31, %label6], [%temp3$17, %label7]
  %temp2$26 = phi i64 [%temp2$18, %label6], [%temp2$29, %label7]
  %result$27 = phi i64 [%result$30, %label6], [%result$28, %label7]
  br label %label3
}

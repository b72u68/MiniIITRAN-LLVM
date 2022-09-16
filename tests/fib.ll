declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %n$1 = bitcast i64 5 to i64
  %temp1$2 = bitcast i64 %n$1 to i64
  %t0$3 = bitcast i64 0 to i64
  %temp2$4 = bitcast i64 %t0$3 to i64
  %t1$5 = bitcast i64 1 to i64
  %temp3$6 = bitcast i64 %t1$5 to i64
  br label %label1
label1:
  %temp9$7 = phi i64 [%temp9$35, %label2], [0, %main__entry]
  %temp8$8 = phi i64 [%temp8$31, %label2], [0, %main__entry]
  %temp7$9 = phi i64 [%temp7$29, %label2], [0, %main__entry]
  %temp6$10 = phi i64 [%temp6$25, %label2], [0, %main__entry]
  %temp5$11 = phi i64 [%temp5$24, %label2], [0, %main__entry]
  %temp4$12 = phi i64 [%temp4$27, %label2], [0, %main__entry]
  %temp11$13 = phi i64 [%temp11$33, %label2], [0, %main__entry]
  %temp10$14 = phi i64 [%temp10$32, %label2], [0, %main__entry]
  %t1$15 = phi i64 [%t1$30, %label2], [%t1$5, %main__entry]
  %t0$16 = phi i64 [%t0$28, %label2], [%t0$3, %main__entry]
  %t$17 = phi i64 [%t$26, %label2], [0, %main__entry]
  %n$18 = phi i64 [%n$34, %label2], [%n$1, %main__entry]
  %temp13$19 = bitcast i64 %n$18 to i64
  %temp14$20 = bitcast i64 0 to i64
  %temp12$21 = icmp sgt i64 %temp13$19, %temp14$20
  br i1 %temp12$21, label %label2, label %label3
label2:
  %temp5$24 = bitcast i64 %t0$16 to i64
  %temp6$25 = bitcast i64 %t1$15 to i64
  %t$26 = add i64 %temp5$24, %temp6$25
  %temp4$27 = bitcast i64 %t$26 to i64
  %t0$28 = bitcast i64 %t1$15 to i64
  %temp7$29 = bitcast i64 %t0$28 to i64
  %t1$30 = bitcast i64 %t$26 to i64
  %temp8$31 = bitcast i64 %t1$30 to i64
  %temp10$32 = bitcast i64 %n$18 to i64
  %temp11$33 = bitcast i64 1 to i64
  %n$34 = sub i64 %temp10$32, %temp11$33
  %temp9$35 = bitcast i64 %n$34 to i64
  br label %label1
label3:
  %result$22 = bitcast i64 %t1$15 to i64
  %temp15$23 = bitcast i64 %result$22 to i64
  ret i64 %result$22
}

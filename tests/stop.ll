declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %result$1 = bitcast i64 0 to i64
  %temp1$2 = bitcast i64 %result$1 to i64
  br label %label1
label1:
  %temp7$3 = phi i64 [%temp7$17, %label5], [0, %main__entry]
  %temp6$4 = phi i64 [%temp6$16, %label5], [0, %main__entry]
  %temp5$5 = phi i1 [%temp5$18, %label5], [0, %main__entry]
  %temp4$6 = phi i64 [%temp4$13, %label5], [0, %main__entry]
  %temp3$7 = phi i64 [%temp3$12, %label5], [0, %main__entry]
  %temp2$8 = phi i64 [%temp2$15, %label5], [0, %main__entry]
  %result$9 = phi i64 [%result$14, %label5], [%result$1, %main__entry]
  %temp9$10 = bitcast i64 1 to i64
  %temp8$11 = trunc i64 %temp9$10 to i1
  br i1 %temp8$11, label %label2, label %label3
label2:
  %temp3$12 = bitcast i64 %result$9 to i64
  %temp4$13 = bitcast i64 1 to i64
  %result$14 = add i64 %temp3$12, %temp4$13
  %temp2$15 = bitcast i64 %result$14 to i64
  %temp6$16 = bitcast i64 %result$14 to i64
  %temp7$17 = bitcast i64 50 to i64
  %temp5$18 = icmp sge i64 %temp6$16, %temp7$17
  br i1 %temp5$18, label %label4, label %label5
label3:
  ret i64 %result$9
label4:
  ret i64 %result$14
  br label %label5
label5:
  br label %label1
}

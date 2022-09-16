declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %result$1 = bitcast i64 0 to i64
  %temp1$2 = bitcast i64 %result$1 to i64
  %temp8$3 = bitcast i64 2 to i64
  %temp9$4 = bitcast i64 1 to i64
  %temp7$5 = icmp slt i64 %temp8$3, %temp9$4
  br i1 %temp7$5, label %label1, label %label2
label1:
  %temp5$12 = bitcast i64 1 to i64
  %temp6$13 = bitcast i64 2 to i64
  %temp4$14 = icmp slt i64 %temp5$12, %temp6$13
  br i1 %temp4$14, label %label3, label %label4
label2:
  %temp6$6 = phi i64 [%temp6$13, %label5], [0, %main__entry]
  %temp5$7 = phi i64 [%temp5$12, %label5], [0, %main__entry]
  %temp4$8 = phi i1 [%temp4$14, %label5], [0, %main__entry]
  %temp3$9 = phi i64 [%temp3$15, %label5], [0, %main__entry]
  %temp2$10 = phi i64 [%temp2$16, %label5], [0, %main__entry]
  %result$11 = phi i64 [%result$17, %label5], [%result$1, %main__entry]
  ret i64 %result$11
label3:
  %result$20 = bitcast i64 1 to i64
  %temp3$21 = bitcast i64 %result$20 to i64
  br label %label5
label4:
  %result$18 = bitcast i64 2 to i64
  %temp2$19 = bitcast i64 %result$18 to i64
  br label %label5
label5:
  %temp3$15 = phi i64 [%temp3$21, %label3], [0, %label4]
  %temp2$16 = phi i64 [0, %label3], [%temp2$19, %label4]
  %result$17 = phi i64 [%result$20, %label3], [%result$18, %label4]
  br label %label2
}

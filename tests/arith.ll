declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %temp4$1 = bitcast i64 1 to i64
  %temp6$2 = bitcast i64 2 to i64
  %temp7$3 = bitcast i64 3 to i64
  %temp5$4 = mul i64 %temp6$2, %temp7$3
  %temp3$5 = add i64 %temp4$1, %temp5$4
  %temp8$6 = bitcast i64 4 to i64
  %temp2$7 = sub i64 %temp3$5, %temp8$6
  %temp10$8 = bitcast i64 2 to i64
  %temp12$9 = bitcast i64 1 to i64
  %temp14$10 = bitcast i64 8 to i64
  %temp15$11 = bitcast i64 0 to i64
  %temp13$12 = mul i64 %temp14$10, %temp15$11
  %temp11$13 = add i64 %temp12$9, %temp13$12
  %temp9$14 = sub i64 %temp10$8, %temp11$13
  %result$15 = sdiv i64 %temp2$7, %temp9$14
  %temp1$16 = bitcast i64 %result$15 to i64
  ret i64 %result$15
}

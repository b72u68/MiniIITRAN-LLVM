declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %temp2$1 = bitcast i64 1 to i64
  %temp4$2 = bitcast i64 1 to i64
  %temp5$3 = bitcast i64 2 to i64
  %b$4 = add i64 %temp4$2, %temp5$3
  %temp3$5 = bitcast i64 %b$4 to i64
  %a$6 = add i64 %temp2$1, %temp3$5
  %temp1$7 = bitcast i64 %a$6 to i64
  %temp7$8 = bitcast i64 %a$6 to i64
  %temp8$9 = bitcast i64 %b$4 to i64
  %result$10 = add i64 %temp7$8, %temp8$9
  %temp6$11 = bitcast i64 %result$10 to i64
  ret i64 %result$10
}

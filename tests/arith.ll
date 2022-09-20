declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %temp3 = mul i64 2, 3
  %temp2 = add i64 1, %temp3
  %temp1 = sub i64 %temp2, 4
  %temp6 = mul i64 8, 0
  %temp5 = add i64 1, %temp6
  %temp4 = sub i64 2, %temp5
  %result = sdiv i64 %temp1, %temp4
  ret i64 %result
}

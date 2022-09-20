declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %result = bitcast i64 0 to i64
  br label %label1
label1:
  %temp3 = bitcast i64 1 to i64
  %temp2 = trunc i64 %temp3 to i1
  br i1 %temp2, label %label2, label %label3
label2:
  %result = add i64 %result, 1
  %temp1 = icmp sge i64 %result, 50
  br i1 %temp1, label %label4, label %label5
label4:
  ret i64 %result
  br label %label5
label5:
  br label %label1
label3:
  ret i64 %result
}

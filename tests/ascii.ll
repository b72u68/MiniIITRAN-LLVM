declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %result = mul i64 109, 7
  %result = bitcast i64 %result to i64
  %result = bitcast i64 %result to i64
  %result = bitcast i64 %result to i64
  %result = bitcast i64 %result to i64
  %result = bitcast i64 %result to i64
  %result = bitcast i64 %result to i64
  %result = bitcast i64 %result to i64
  %result = bitcast i64 %result to i64
  %result = bitcast i64 %result to i64
  %temp3 = trunc i64 %result to i1
  br i1 %temp3, label %label1, label %label2
label1:
  %temp2 = trunc i64 %result to i1
  %temp1 = xor i1 %temp2, 1
  br i1 %temp1, label %label3, label %label4
label3:
  ret i64 %result
  br label %label5
label4:
  ret i64 %result
  br label %label5
label5:
  br label %label2
label2:
  ret i64 %result
  ret i64 %result
  ret i64 %result
  ret i64 %result
  ret i64 %result
  ret i64 %result
  ret i64 %result
  ret i64 %result
}

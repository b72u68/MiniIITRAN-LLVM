declare i8* @malloc(i32)
define i64 @main() {
main__entry:
  %n = bitcast i64 5 to i64
  %t0 = bitcast i64 0 to i64
  %t1 = bitcast i64 1 to i64
  br label %label1
label1:
  %temp1 = icmp sgt i64 %n, 0
  br i1 %temp1, label %label2, label %label3
label2:
  %t = add i64 %t0, %t1
  %t0 = bitcast i64 %t1 to i64
  %t1 = bitcast i64 %t to i64
  %n = sub i64 %n, 1
  br label %label1
label3:
  %result = bitcast i64 %t1 to i64
  ret i64 %result
}

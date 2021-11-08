import UIKit

/*
 for 루프상수 in 순회대상 {
  // 실행할 구문..
 }
 */

for i in 1...4 {
    print(i)
}

let array = [1,3,5,7,9]
for i in array {
    print(i)
}

/*
 while 조건식 {
  // 실행할 구문
 }
 */
var number = 5

while number < 10 {
    number += 1
}
number

/*
 repeat {
  //실행할 구문
 } while 조건식
 */
var x = 6

repeat {
    x += 2
} while x < 5

print(x)

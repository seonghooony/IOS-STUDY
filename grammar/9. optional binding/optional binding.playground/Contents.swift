import UIKit

/*
 명시적 해제 -> 강제 해제, 비강제 해제(옵셔널 바인딩)
 묵시적 해제 -> 컴파일러에의한 자동해제, 옵셔널의 묵시적 해제
 */

//명시적 해제
var number: Int? = 3
print(number)   //아직 옵셔널
print(number!)  //옵셔널 강제 해제(안전하지 못하여 위험함)

// number의 옵셔널을 벗겨 result에 넣음
//if var result = number { //이거도 가능
if let result = number {
    print(result)
} else{
    
}
//위의 옵셔널 해제 방법은 if문 내에서만 가능함

//하단 방법은 if문 밖에서도 쓸 수 있도록 해제함
func test() {
    let number: Int? = 5
    guard let result = number else {return}
    print(result)
}
test()

//묵시적 해제
let value: Int? = 6
//비교연산자를 통한 optional 값은 컴파일러가 자동적으로 해제시켜줌
if value == 6 {
    print("value가 6입니다.")
} else {
    print("value가 6이 아닙니다.")
}

let string = "12"
//Int(string) 은 optional 형태로 반환함
var stringToInt1: Int? = Int(string) //optional 형태로 받음
print(stringToInt1)
//print(stringToInt1+1) //optional이 해제되지 않은 상태이므로 +1이 안됨
var stringToInt2: Int! = Int(string) //optional 해제 형태로 받음
print(stringToInt2)
print(stringToInt2+1)


import UIKit

/*
 struct 구조체이름 {
  프로퍼티(변수)와 메서드(함수)
 }
 */

//구조체와 클래스는 보통 파스칼 표기법
struct User {
    var nickname: String
    var age: Int
    
    func information() {
        print("\(nickname) \(age)")
    }
}

var user = User(nickname: "hoon", age: 28)

user.nickname
user.nickname = "kim"
user.nickname

user.information()

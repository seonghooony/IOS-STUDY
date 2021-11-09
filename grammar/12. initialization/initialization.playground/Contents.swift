import UIKit

/*
 init(매개변수: 타입, ...) {
   // 프로퍼티 초기화
   // 인스턴스 생성시 필요한 설정을 해주는 코드 작성
 }
 */

class User {
    var nickname: String
    var age: Int
    
    init(nickname: String, age: Int) {
        self.nickname = nickname
        self.age = age
    }
    
    init(age: Int) {
        self.nickname = "default"
        self.age = age
    }
    
    //클래스가 메모리에서 사라질때 할 작업
    deinit {
        print("deinit user")
    }
}

var user = User(nickname: "hoon", age: 28)

user.nickname
user.age

var user2 = User(age: 22)
user2.nickname
user2.age

var user3: User? = User(age: 23)
user3?.nickname
//nil 로 만들 때 자동으로 클래스 자체를 소멸 시켜버림
user3 = nil

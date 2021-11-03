import UIKit

/*
 func 함수명(파라미터이름: 데이터타입) -> 반환 타입{
    return 반환값
 }
 */

func sum(a: Int, b: Int) -> Int {
    return a+b
}

sum(a: 5, b: 3)

func hello() -> String {
    return "hello"
}

hello()

//func printName() {
func printName() -> Void {
    print("Hello")
}
printName()

func greeting(friend: String, me: String = "gunter") {
    print("Hello, \(friend)! I'm \(me)")
}
greeting(friend: "소희")
greeting(friend: "현재", me: "성훈")

/*
 func 함수이름(전달인자레이블 매개변수이름: 매개변수타입, 전달인자레이블 매개변수이름: 매개변수타입...) -> 반환타입 {
    return 반환값
 }
 */
func sendMessage(from myName: String, to name: String) -> String {
    return "Hello \(name)! I'm \(myName)"
}
sendMessage(from: "성훈", to: "소희")

func sendMessage(_ name: String) -> String {
    return "Hello \(name)!"
}
sendMessage("현재")

//가변매개변수 (배열형식으로 넘겨받음)
func sendMessage(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)"
}

sendMessage(me: "성훈", friends: "소희", "현재", "경민")



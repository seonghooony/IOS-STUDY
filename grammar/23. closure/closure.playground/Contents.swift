import UIKit
import Foundation
/*
 클로저
 코드에서 전달 및 사용할 수 있는 독립 기능 브록이며, 일급 객체의 역할을 할 수 있음

 일급객체
 전달 인자로 보낼 수 있고 변수/상수 등으로 저장하거나 전달할 수 있으며, 함수의 반환 값이 될 수도 있다.
 */

//named Closure
func hello() {
    print("안녕하세요")
}

//unnamed Closure
//보통 클로저라면 이것에 해당
let hello2 = { print("안녕하세요") }

/*
 { (매개변수) -> 리턴타입 in
   실행구문
 }
 */

let helloClosure = { () -> () in
    print("hello")
}

helloClosure()


let helloClosure2 = { (name: String) -> String in
    return "Hello, \(name)"
}
//함수의 파라미터 레이블을 사용하지 않고 바로 전달.
helloClosure2("Hoon")

func doSomething(closure: () -> ()) {
    closure()
}

doSomething(closure: { () -> () in
    print("hello")
})

doSomething() {
    print("hello2")
}

doSomething {
    print("hello3")
}
//위 3개는 같음

func doSomething2() -> () -> () {
    return { () -> () in
        print("hello4")
    }
}

doSomething2()()

func doSomething2(success: () -> (), fail: () -> ()) {
    
}

doSomething2 {
    
} fail: {
    
}

func doSomething3(closure: (Int, Int, Int) -> Int) {
    closure(1,2,3)
}

//생략과정

doSomething3(closure: { (a, b, c) in
    return a+b+c
})

doSomething3(closure: {
    $0+$1+$2
})

doSomething3(closure: {
    $0+$1+$2
})

doSomething3() {
    $0+$1+$2
}

doSomething3 {
    $0+$1+$2
}

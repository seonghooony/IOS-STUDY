import UIKit

/*
 특정 역활을 하기 위한 메서드, 프로퍼티, 기타 요구사항 등의 청사진
 */

/*
 protocol 이름 {
    
 }
 */

protocol SomeProtocol {
    
}
protocol SomeProtocol2 {
    
}
struct SomeStructure: SomeProtocol, SomeProtocol2 {
    
}

/*
 //주의할점 : 상속받을 클래스가 있다면 먼저 쓰고, 그 뒤 프로토콜을 나열하면 됨.
 class someClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    
 }
 */
//프로토콜은 자신을 채택한 타입이 어떠한 프로퍼티를 구현 해야하는지 요구할 수 있음
//프로퍼티는 이름과 타입 그리고 읽기만인지 읽기 쓰기 둘다인지를 지정해야함
protocol FirstProtocol {
    var name: Int { get set }
    var age: Int { get }
}

protocol AnotherProtocol {
    //타입 프로퍼티를 요구하려면 항상 static을 써주어야 한다
    static var someTypeProperty: Int { get set }
}

protocol FullyNames {
    var fullName: String { get set }
    func printFullName()
}

struct Person: FullyNames {
    //채택한 프로토콜을 준수하기 때문에 오류 사라짐
    var fullName: String
    
    //printFullName메서드를 만들어야함
    func printFullName() {
        print(fullName)
    }
}

protocol Someprotocol3 {
    //메서드를 지정할 때에는 함수명과 매개변수만을 지정해주면 된다.
    func someTypeMethod()
}

protocol Someprotocol4 {
    //해당 프로토콜을 채택하는 클래스는 요구되는 생성자는 하단과 같음
    init(someParameter: Int)
}

protocol someProtocol5 {
    init()
}

class SomeClass: someProtocol5 {
    //someProtocol5에서 요구되는 생성자를 생성해야함
    //해당 프로토콜의 생성자를 채택해야하기에 required를 붙여야함
    //클래스 자체가 상속받을 수 없는 final 클래스라면 required 라는 상속자를 안붙여도 됨
    required init() {
        
    }
}

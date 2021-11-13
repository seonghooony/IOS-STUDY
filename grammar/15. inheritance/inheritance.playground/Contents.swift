import UIKit
import Foundation

class Vehicle {
    //final을 정의하면 상수처리가 되어 변경이 불가능하게 됨 상속된 후에도 변경 불가
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        print("speaker on")
    }
}

/*
 class 클래스이름: 부모클래스이름 {
   //하위클래스 정의
 }
 */
//어떤 상속도 받지 않은 클래스를 base class
//부모 클래스를 super class
//자식 클래스를 sub class

class Bicycle: Vehicle {
    var hasBasket = false
}

//부모 클래스의 프로퍼티를 전부 상속받아 사용할 수 있게됨
var bicycle = Bicycle()
bicycle.currentSpeed
bicycle.currentSpeed = 15.0
bicycle.currentSpeed

class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise() //부모 클래스의 함수 사용
        print("choo choo")
    }
}

let train = Train()
//오버라이드 된 함수
train.makeNoise()

class Car: Vehicle{
    var gear = 1
    var test = 2
    //override var currentSpeed: Double = 123.0 //get set 프로퍼티만 가능
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 30.0
car.gear = 2
print(car.description)

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
            test = 20
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
print("\(automatic.test)")

/*
 메소드, 프로퍼티, 서브스크립트가 override를 금지할 수 있는 방법은 super class의 해당사항에 final을 붙이면 됨.
 주로 재정의 할 필요가 없을 때 final을 사용하는 것이 좋음.
 참고로 클래스 자체가 상속되는 것을 막을려고 할 때도 final을 사용 할 수 있음.
 */

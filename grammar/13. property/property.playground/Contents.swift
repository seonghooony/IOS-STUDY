import UIKit

/*
 저장 프로퍼티
 연산 프로퍼티
 타입 프로퍼티
 */

struct Dog {
    var name: String
    let gender: String
}

var dog = Dog(name: "toto", gender: "Male")
print(dog)
dog.name = "성훈"

//구조체를 상수로 선언시 내부 프로퍼티들도 전부 상수로 바뀜
let dog2 = Dog(name: "gunter", gender: "male")
//dog2.name = "change"

class Cat {
    var name: String
    let gender: String
    
    init(name: String, gender: String){
        self.name = name
        self.gender = gender
    }
}

//참조 타입이기 때문에 상수로 클래스를 선언하더라도 클래스 내 프로퍼티는 변경 가능함
let cat = Cat(name: "json", gender: "male")
cat.name = "gunter"
print(cat.name)
//단 프로퍼티가 상수이면 변경이 불가능함
//cat.gender = "female"


//계산 프로퍼티
struct Stock {
    var averagePrice: Int
    var quantity: Int
    var purchasePrice: Int {
        get {
            return averagePrice * quantity
        }
        
        set(newPrice) {
            averagePrice = newPrice / quantity
        }
        /*
         set {
            averagePrice = newValue / quantity //매개변수 설정 안할 시 newValue로 default 된다.
         }
         */
    }
}

var stock = Stock(averagePrice: 2300, quantity: 3)
print(stock)
stock.purchasePrice
stock.purchasePrice = 3000
stock.averagePrice


//저장 프로퍼티
class Account {
    var credit: Int = 0 {
        //소괄호 이름 지정
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}

var account = Account()
account.credit = 1000

//타입 프로퍼티
struct SomeStructure {
    //스토어 타입 프로퍼티
    static var storedTypeProperty = "some value."
    //계산 타입 프로퍼티
    static var computedTypeProperty: Int {
        //return 1
        get {
            return 11
        }
        set {
            storedTypeProperty = "set changed"
        }
    }
}
//타입프로퍼티는 인스턴스를 만들지 않아도 곧바로 해당 프로퍼티에 접근 할 수 있음.
SomeStructure.computedTypeProperty
SomeStructure.storedTypeProperty
SomeStructure.storedTypeProperty = "hello"
SomeStructure.storedTypeProperty
SomeStructure.computedTypeProperty = 21
SomeStructure.storedTypeProperty

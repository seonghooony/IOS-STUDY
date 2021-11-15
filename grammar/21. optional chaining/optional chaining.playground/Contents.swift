import UIKit
import Foundation
/*
 옵셔널 체이닝
 옵셔널에 속해 있는 nil일지도 모르는 프로퍼티, 메서드, 서브스크립션 등을 가져오거나 호출할 때 사용할 수 있는 일련의 과정
 */

struct Developer {
    let name: String
}

struct Company {
    let name: String
    var developer: Developer?
}

var developer = Developer(name: "han")
var company = Company(name: "Hoon", developer: developer)

print(company.developer)
//옵셔널을 뱃겨야함. 내부에 프로퍼티를 사용하기전 ? 나 ! 를 붙여 사용
print(company.developer?.name)
print(company.developer!.name)
// 옵셔널 바인딩 이외 옵셔널을 벗기는 방법 = 옵셔널 체이닝
// ?로 옵셔널 체이닝을 하면 접근한 프로퍼티는 항상 옵셔널에 감싸져있음
// !로 옵셔널 체이닝을 하면 접근한 프로퍼티는 강제 언랩핑하기에 옵셔닝이 없음

//옵셔널값을 벗기고 싶으면 옵셔널 바인딩을 사용하면 됨.


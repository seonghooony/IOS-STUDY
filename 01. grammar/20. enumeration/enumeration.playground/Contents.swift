import UIKit
import Foundation

/*
 열거형
 연관성이 있는 값을 모아 놓은 것
 */
//원시값을 가지고 싶으면 ' : type ' 을 붙인다.
enum CompassPoint: String {
    case north = "북" //, south, east, west
    case south = "남"
    case east = "동"
    case west = "서"
}

var direction = CompassPoint.east
direction = .west

switch direction {
case .north:
    print(direction.rawValue)
case .south:
    print(direction.rawValue)
case .east:
    print(direction.rawValue)
case .west:
    //원시값 출력
    print(direction.rawValue)
}

let direction2 = CompassPoint(rawValue: "남")

enum PhoneError {
    case unknown
    //연관값
    case batteryLow(String)
}

let error = PhoneError.batteryLow("배터리가 곧 방전됩니다.")
//let error = PhoneError.unknown

//연관값 추출
switch error {
case .batteryLow(let message):
    print(message)
case .unknown:
    print("알 수 없는 에러입니다.")
}

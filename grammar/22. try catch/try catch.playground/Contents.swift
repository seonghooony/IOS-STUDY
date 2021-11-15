import UIKit
import Foundation

/*
 발생(throwing)
 감지(catching)
 전파(propagating)
 조작(manipulating)
 */

enum PhoneError:Error {
    case unknown
    case battaryLow(battaryLevel: Int)
}

//throw PhoneError.battaryLow(battaryLevel: 20)

func checkPhoneBatteryStatus(batteryLevel: Int) throws -> String {
    guard batteryLevel != -1 else { throw PhoneError.unknown }
    guard batteryLevel >= 20 else { throw PhoneError.battaryLow(battaryLevel: batteryLevel) }
    return "배터리 상태가 정상입니다."
}

/*
 do {
  try 오류 발생 가능코드
 } catch 오류 패턴 {
  처리 코드
 }
 */

do {
    try checkPhoneBatteryStatus(batteryLevel: 19)
    
} catch PhoneError.unknown {
    print("알 수 없는 에러입니다.")
} catch PhoneError.battaryLow(let batteryLevel) {
    print("베터리 전원 부족 남은 배터리 : \(batteryLevel)%")
} catch {
    print("그 외 오류 발생 : \(error)")
}

let status = try? checkPhoneBatteryStatus(batteryLevel: -1)
print(status)

//오류가 절대 발생하지 않을것이라고 판단이 될 때 ! 사용 가능
let status2 = try! checkPhoneBatteryStatus(batteryLevel: 30)
print(status2)

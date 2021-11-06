import UIKit

/**
 if 조건식 {
    조건식이 만족하면 해당 구문 실행
 } else if 조건식2 {
    조건식2를 만족할 때 실행할 구문
 } else {
    만족하지 않으면 해당 구문 실행
 }
 */

let age = 12
if age < 19 {
    print("미성년자 입니다.")
} else {
    print("성년자 입니다.")
}

let animal = "cat"

if animal == "dog" {
    print("강아지 사료 주기")
} else if animal == "cat" {
    print("고양이 사료 주기")
} else {
    print("해당하는 동물 사료가 없음")
}

/*
 switch 비교대상 {
  case 패턴1:
    // 패턴1 일치할 때 실행되는 구문
  case 패턴2, 패턴3:
    // 패턴2, 3이 일치할 때 실행되는 구문
  default:
    // 어느 비교 패턴과도 일치하지 않을 때 실행되는 구문
 */

let color = "green"

switch color {
case "blue":
    print("파란색입니다.")
case "green":
    print("초록색입니다.")
case " yellow":
    print("노랑색입니다.")
default:
    print("찾는 색상이 없습니다.")
}

let temperature = 30

switch temperature {
case -20...9:
    print("겨울입니다.")
case 10...14:
    print("가을입니다.")
case 15...25:
    print("봄입니다.")
case 26...35:
    print("여름입니다.")
default:
    print("이상기후입니다.")
}

//segue 로 화면 이동하는 법
//segue는 스토리보드 상에서 설정하여 기능을 추가하는 방법 중 하나임

//push일 경우 루트 네비게이트뷰컨트롤러가 존재하며 계층구조형식으로 되어있음.

//present일 경우 해당 화면이 하단에서 모달뷰처럼 생성이 됨.

/*
 해당 화면으로 이동할 때 세팅하는 방법은
 override func prepare 를 통해 해당 화면의 뷰컨트롤 인스턴스를 다운캐스팅 하여 해당 인스턴스의 변수에 직접 접근하여 세팅한다.
 
 이전 화면으로 이동할 때 세팅하는 방법은
 프로토콜을 만든 후 > 해당 프로토콜에 대한 delegate 변수 선언 후 > 액션에 delegate변수의 프로토콜의 func 파라미터를 세팅 한 후 > 이전 화면의 클래스에서 해당 프로토콜을 채택한 후 > 해당화면인스턴스.delegate = self > 그후 프로토콜 내 프로퍼티 func 재정의
 */

/*
 view controller에서 다른 view controller 호출 시
 self.present(해당뷰컨트롤러 인스턴스, animated: true, completion: nil)
 
 돌아갈 시
 self.presentingViewController?.dismiss(animated: true, completion: nil)
 */

/*
 navigation controller 에서 화면 전환 시
 self.navigationController?.pushViewController(해당뷰컨트롤러 인스턴스, animated: true)
 
 돌아갈 시
 self.navigationController?.popViewController(animated: true)
 */



//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by SeongHoon Kim on 2021/11/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") else { return }
        //열거형을 이미 아는 경우 . ~ 으로 표현 가능.
        // .east를 .west로 바꾼다던지..?
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func tapCodePushButton(_ sender: UIButton) {
        //우선 viewcontroller를 인스턴스화 시킨 후
        //optional로 반환하기에 guard문 사용
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") else { return }
        
        //네비게이션컨트롤러에 해당 뷰컨트롤러 인스턴스를 스택에 쌓음
        self.navigationController?.pushViewController(viewController, animated: true)
        
        
    }
    
    
}


//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by SeongHoon Kim on 2021/11/18.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    //delegate변수 앞에서는 꼭 weak라는 키워드를 붙여줘야함 강한참조가 되버려 메모리 누수가 발생함.
    //delegate변수는 위임할 준비가 되었음.
    weak var delegate: SendDataDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //옵셔널 바인딩 시키기 (name은 ?로 옵셔널 상태이므로 껍질을 까줘야함)
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.sendData(name: "Hoons")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}

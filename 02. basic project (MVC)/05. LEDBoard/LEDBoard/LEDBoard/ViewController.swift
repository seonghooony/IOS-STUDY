//
//  ViewController.swift
//  LEDBoard
//
//  Created by SeongHoon Kim on 2021/11/21.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {
    @IBOutlet weak var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
    }
    
    //다음 화면에 넘기기 전 준비 세팅.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //다음화면의 뷰컨트롤러 인스턴스를 다운캐스팅 한 후
        if let settingViewController = segue.destination as? SettingViewController {
            //해당 화면에다가 받아온 변수를 위임받기 위해 델리게이트 변수를 세팅함.
            settingViewController.delegate = self
            //해당 화면의 변수를 다음 화면의 변수들에 집어넣음
            settingViewController.ledText = self.contentsLabel.text
            settingViewController.textColor = self.contentsLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
    
    //위임받은 프로토콜을 해당 화면에 작업함.
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contentsLabel.text = text
        }
        self.contentsLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }

}


//
//  ViewController.swift
//  AutoLayout
//
//  Created by SeongHoon Kim on 2021/11/16.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func tapChangeColorButton(_ sender: UIButton) {
        self.colorView.backgroundColor = UIColor.blue
        print("색상 변경 버튼이 클릭 되었음.")
    }
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


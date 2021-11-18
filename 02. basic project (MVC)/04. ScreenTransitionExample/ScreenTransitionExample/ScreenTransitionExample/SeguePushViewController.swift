//
//  SeguePushViewController.swift
//  ScreenTransitionExample
//
//  Created by SeongHoon Kim on 2021/11/18.
//

import UIKit

class SeguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
}

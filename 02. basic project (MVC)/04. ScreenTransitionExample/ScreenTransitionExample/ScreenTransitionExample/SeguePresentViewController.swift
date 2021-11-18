//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by SeongHoon Kim on 2021/11/18.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

}

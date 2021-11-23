//
//  RoundButton.swift
//  Calculator
//
//  Created by SeongHoon Kim on 2021/11/22.
//

import UIKit

//스토리보드에 실시간으로 보이기
@IBDesignable
class RoundButton: UIButton {
    //커스텀 속성 추가
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

}

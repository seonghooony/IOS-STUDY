//
//  ViewController.swift
//  Calculator
//
//  Created by SeongHoon Kim on 2021/11/22.
//

import UIKit

//계산기 기능 열거형
enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    
    var displayNumber = ""  //보여지는 숫자
    var firstOperand = ""   //첫 숫자
    var secondOperand = ""  //연산할 숫자
    var result = ""         //결과
    var currentOperation: Operation = .unknown  //현재 연산자
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        //버튼에 해당하는 숫자를 불러옴
        guard let numberValue = sender.title(for: .normal) else { return }
        //최대 9자리까지 입력가능하도록 제한
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    //AC 버튼
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    
    // . 버튼
    @IBAction func tapDotButton(_ sender: UIButton) {
        //최대 9자리이므로 8자리에서만 .이 가능
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    // 나누기 버튼
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    // 곱셈 버튼
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    
    // 빼기 버튼
    @IBAction func tapSubractButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    
    // 더하기 버튼
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    // = 버튼
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    //연산자 함수
    func operation(_ operation: Operation) {
        //연산자 기능을 사용할 경우
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                // String -> Double 타입 변환
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                default:
                    break
                }
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    // 1로 나눈나머지가 0일 경우 정수형으로 표현(소수점없이)
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            
            self.currentOperation = operation
            
        // 연산자 없이 '=' 버튼 눌렀을 경우
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
        
    }
}


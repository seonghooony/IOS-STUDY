//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by SeongHoon Kim on 2021/11/24.
//

import UIKit

class WriteDiaryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentsTextView: UITextView!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContensTextView()
        self.configureDatePicker()
    }
    
    //텍스트필드뷰의 테두리를 나타내줌.
    private func configureContensTextView() {
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.contentsTextView.layer.borderColor = borderColor.cgColor
        self.contentsTextView.layer.borderWidth = 0.5
        self.contentsTextView.layer.cornerRadius = 5.0
    }
    
    private func configureDatePicker() {
        //날짜만 나오게 설정
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        //데이트피커에서 날짜를 클릭했을 때 샐랙터 함수가 실행되도록 함 (변경될 시마다)
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        self.datePicker.locale = Locale(identifier: "ko-KR")
        self.dateTextField.inputView = self.datePicker
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formmater = DateFormatter()
        formmater.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        formmater.locale = Locale(identifier: "ko_KR")
        
        self.diaryDate = datePicker.date
        self.dateTextField.text = formmater.string(from: datePicker.date)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //빈 화면을 눌러줄때 마다 하단 키보드나 데이트피커가 사라짐
        self.view.endEditing(true)
    }
    
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
         
    }
}

//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by SeongHoon Kim on 2021/11/24.
//

import UIKit

enum DiaryEditorMode {
    case new
    case edit(IndexPath, Diary)
}

protocol WriteDiaryViewDelegate: AnyObject {
    func didSelectRegister(diary: Diary)
}

class WriteDiaryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentsTextView: UITextView!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    weak var delegate: WriteDiaryViewDelegate?
    
    var diaryEditorMode: DiaryEditorMode = .new
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContensTextView()
        self.configureDatePicker()
        self.configureInputField()
        self.configureEditMode()
        self.confirmButton.isEnabled = false
    }
    
    // 셀을 클릭하여 수정모드일 경우 실행
    private func configureEditMode() {
        switch self.diaryEditorMode {
        case let .edit(_, diary):
            self.titleTextField.text = diary.title
            self.contentsTextView.text = diary.contents
            self.dateTextField.text = self.dateToString(date: diary.date)
            self.diaryDate = diary.date
            self.confirmButton.title = "수정"
            
        default:
            break
        }
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    //텍스트필드뷰의 테두리를 나타내줌.
    private func configureContensTextView() {
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.contentsTextView.layer.borderColor = borderColor.cgColor
        self.contentsTextView.layer.borderWidth = 0.5
        self.contentsTextView.layer.cornerRadius = 5.0
    }
    
    //날짜 textField에 데이트피커 나오도록 함
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
        self.dateTextField.sendActions(for: .editingChanged)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //빈 화면을 눌러줄때 마다 하단 키보드나 데이트피커가 사라짐
        self.view.endEditing(true)
    }
    
    private func configureInputField() {
        self.contentsTextView.delegate = self
        //확인, 수정 버튼 활성화 검증
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func titleTextFieldDidChange(_ TextField: UITextField) {
        self.validateInputField()
    }
    
    @objc private func dateTextFieldDidChange(_ TextField: UITextField) {
        self.validateInputField()
    }
    
    //확인, 수정 버튼 클릭 시
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
        
        guard let title = self.titleTextField.text else { return }
        guard let contents = self.contentsTextView.text else { return }
        guard let date = self.diaryDate else { return }
        
        switch self.diaryEditorMode {
        case .new:
            let diary = Diary(
                uuidString: UUID().uuidString,
                title: title,
                contents: contents,
                date: date,
                isStar: false
            )
            self.delegate?.didSelectRegister(diary: diary)
        case let .edit(indexPath, diary):
            //옵저버 객체만들기
            let diary = Diary(
                uuidString: diary.uuidString,
                title: title,
                contents: contents,
                date: date,
                isStar: diary.isStar
            )
            NotificationCenter.default.post(
                name: NSNotification.Name("editDiary"),
                object: diary,
                userInfo: nil
            )
            
        }
        
        
        self.navigationController?.popViewController(animated: true)
         
    }
    
    private func validateInputField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
    }
    
}


extension WriteDiaryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.validateInputField()
    }
}

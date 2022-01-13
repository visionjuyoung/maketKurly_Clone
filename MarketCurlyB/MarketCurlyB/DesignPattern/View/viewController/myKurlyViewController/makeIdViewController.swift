//
//  makeIdViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/09.
//

import UIKit

class makeIdViewController: UIViewController {
    
    lazy var dataManager: SignInDataManager = SignInDataManager()
    lazy var checkIdDataManager: CheckIdDataManager = CheckIdDataManager()
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telNumTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    

    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var checkId: UIButton!
    @IBOutlet weak var messageBtn: UIButton!
    @IBOutlet weak var addressBtn: UIButton!
    @IBOutlet weak var birtyhStack: UIStackView!
    @IBOutlet weak var boyBtn: UIButton!
    @IBOutlet weak var girlBtn: UIButton!
    @IBOutlet weak var noSelectBtn: UIButton!
    @IBOutlet weak var recommendId: UIButton!
    @IBOutlet weak var eventName: UIButton!
    
    @IBOutlet weak var allAgree: UIButton!
    @IBOutlet weak var agree1Btn: UIButton!
    @IBOutlet weak var agree2Btn: UIButton!
    @IBOutlet weak var agree3Btn: UIButton!
    @IBOutlet weak var agree4Btn: UIButton!
    @IBOutlet weak var agree5Btn: UIButton!
    @IBOutlet weak var smsBtn: UIButton!
    @IBOutlet weak var emailBtn: UIButton!
    
    var birthDate: String?
    var genderValue: String?
    var addValue1: String?
    var addValue2: String?
    var smsAgree: String = "N"
    var emailAgree: String = "N"
    var agree1: String = "N"
    var agree2: String = "N"
    var agree3: String = "N"
    var agree4: String = "N"
    var agree5: String = "N"
    
    var message: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
        
    }
    
    func setInit() {
        checkId.layer.borderWidth = 1
        checkId.layer.borderColor = UIColor.purple.cgColor
        checkId.layer.cornerRadius = 5
        messageBtn.layer.borderWidth = 1
        messageBtn.layer.borderColor = UIColor.systemGray4.cgColor
        messageBtn.layer.cornerRadius = 5
        birtyhStack.layer.borderWidth = 1
        birtyhStack.layer.borderColor = UIColor.systemGray5.cgColor
        birtyhStack.layer.cornerRadius = 5
        checkSexButton()
        setAddInfoButton()
        setAgreeButton()
    }
    
    func checkSexButton() {
        var buttons: [UIButton] = [boyBtn, girlBtn, noSelectBtn]
        for button in buttons {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGray5.cgColor
            button.layer.cornerRadius = 12
            button.layer.backgroundColor = UIColor.white.cgColor
            button.isSelected = false
        }
    }
    
    func setAddInfoButton() {
        recommendId.layer.borderWidth = 1
        recommendId.layer.borderColor = UIColor.systemGray5.cgColor
        recommendId.layer.cornerRadius = 12
        recommendId.layer.backgroundColor = UIColor.white.cgColor
        recommendId.isSelected = false
        eventName.layer.borderWidth = 1
        eventName.layer.borderColor = UIColor.systemGray5.cgColor
        eventName.layer.cornerRadius = 12
        eventName.layer.backgroundColor = UIColor.white.cgColor
        recommendId.isSelected = false
    }
    
    func setAgreeButton() {
        var buttons: [UIButton] = [allAgree, agree1Btn, agree2Btn,agree3Btn,agree4Btn,agree5Btn, smsBtn, emailBtn]
        for button in buttons {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGray5.cgColor
            button.layer.cornerRadius = 12
            button.backgroundColor = .white
            button.isSelected = false
        }
    }
    
    @IBAction func pressSexButton(_ sender: UIButton) {
        checkSexButton()
        sender.backgroundColor = .purple
        sender.isSelected = true
        if sender.tag == 100 {
            genderValue = "F"
        } else if sender.tag == 101 {
            genderValue = "M"
        } else if sender.tag == 102 {
            genderValue = nil
        }
    }
    
    @IBAction func pressCheckId(_ sender: UIButton) {
        checkIdDataManager.checkId(parameters: idTextField.text!, delegate: self)
    }
    
    @IBAction func pressAddButton(_ sender: UIButton) {
        setAddInfoButton()
        sender.backgroundColor = .purple
        sender.isSelected = true
        
        if sender.tag == 104 {
            addValue1 = "aaaa1234"
            addValue2 = nil
        } else if sender.tag == 105 {
            addValue1 = nil
            addValue2 = "이벤트"
        }
    }
    
    @IBAction func pressAgreeButton(_ sender: UIButton) {
        if sender.isSelected {
            sender.backgroundColor = .white
            sender.isSelected = false
            if sender.tag == 106{
                agree1 = "N"
            } else if sender.tag == 107 {
                agree2 = "N"
            } else if sender.tag == 108 {
                agree3 = "N"
            } else if sender.tag == 109 {
                smsBtn.isSelected = false
                emailBtn.isSelected = false
                smsBtn.backgroundColor = .white
                emailBtn.backgroundColor = .white
                smsAgree = "N"
                emailAgree = "N"
            } else if sender.tag == 110 {
                smsAgree = "N"
            } else if sender.tag == 111 {
                smsAgree = "N"
            } else if sender.tag == 112 {
                agree5 = "N"
            }
        } else {
            sender.backgroundColor = .purple
            sender.isSelected = true
            if sender.tag == 106{
                agree1 = "Y"
            } else if sender.tag == 107 {
                agree2 = "Y"
            } else if sender.tag == 108 {
                agree3 = "Y"
            } else if sender.tag == 109 {
                smsBtn.isSelected = true
                emailBtn.isSelected = true
                smsBtn.backgroundColor = .purple
                emailBtn.backgroundColor = .purple
                smsAgree = "Y"
                emailAgree = "Y"
            } else if sender.tag == 110 {
                smsAgree = "Y"
            } else if sender.tag == 111 {
                smsAgree = "Y"
            } else if sender.tag == 112 {
                agree5 = "Y"
            }
        }
    }
    
    @IBAction func pressAllButton(_ sender: UIButton) {
        if sender.isSelected == true {
            setAgreeButton()
            agree1 = "N"
            agree2 = "N"
            agree3 = "N"
            smsAgree = "N"
            emailAgree = "N"
            agree5 = "N"
        } else {
            var buttons: [UIButton] = [allAgree, agree1Btn, agree2Btn,agree3Btn,agree4Btn,agree5Btn, smsBtn, emailBtn]
            for button in buttons {
                button.backgroundColor = .purple
                button.isSelected = true
            }
            agree1 = "Y"
            agree2 = "Y"
            agree3 = "Y"
            smsAgree = "Y"
            emailAgree = "Y"
            agree5 = "Y"
        }
    }
    
    @IBAction func pressSignInButton(_ sender: UIButton) {
        guard let id = idTextField.text, id != "" else {
            print("id")
            return
        }
        
        guard let password = passwordTextField.text, password != "" else {
            print("password")
            return
        }
        
        guard let checkPassword = checkPasswordTextField.text, password == checkPassword else {
            print("passwordcheck")
            return
        }
        
        guard let name = nameTextField.text, name != "" else {
            print("name")
            return
        }
        
        guard let email = emailTextField.text, email != "" else {
            print("email")
            return
        }
        
        guard let telNum = telNumTextField.text, telNum != "" else {
            print("tel")
            return
        }
        
        guard let year = yearTextField.text, year != "" else {
            print("yy")
            return
        }
        
        guard let month = monthTextField.text, month != "" else {
            print("mm")
            return
        }
        
        guard let date = dateTextField.text, date != "" else {
            print("dd")
            return
        }
        birthDate = "\(year)-\(month)-\(date)"

        guard let birth: String = birthDate else {
            return
        }
        
        print("----")
        print(name)
        print(id)
        print(password)
        print(email)
        print(telNum)
        print(birth)
        print(genderValue)
        print(addValue1)
        print(addValue2)
        print(agree1)
        print(agree2)
        print(agree3)
        print(smsAgree)
        print(emailAgree)
        print(agree5)
        
        let input = SignInRequest(name: name, id: id, pwd: password, email: email, phone: telNum, adress: "서울시", extraAdress: "개포동", birthDate: birth, gender: genderValue, recommender: addValue1, eventName: addValue2, isTermsOfUseAgree: agree1, isPersonalInfoCollectAgree: agree2, isPersonalInfoUsageAgree: agree3, isSmsReceiveAgree: smsAgree, isEmailReceiveAgree: emailAgree, isAgeAboveForteen: agree5)
        dataManager.postSignIn(input, delegate: self)
        print("터치됨")
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension makeIdViewController {
    func SignIndidSuccess(_ result: SignInResult) {
        print(result)
    }
    
    func checkIdMessage(result: SignInResult) {
        print(result)
    }
    
    func SignInfaliedRequest() {
        print("실패")
    }
}

extension makeIdViewController {
    func checkIdSuccess(result: String) {
        message = result
        print(message)
    }
    
    func checkIdFail(){
        print("실패")
    }
}

struct SignInTemplate {
    var name: String = ""
    var id: String = ""
    var pwd: String = ""
    var email: String = ""
    var phone: String = ""
    var adress: String = ""
    var exraAdress : String = ""
    var birthDate: String?
    var gender: String?
    var recommender: String?
    var eventName: String?
    var isTermsOfUseAgree: String = ""
    var isPersonalInfoCollectAgree: String = ""
    var isPersonalInfoUsageAgree: String?
    var isSmsReceiveAgree: String?
    var isEmailReceiveAgree: String?
    var isAgeAboveForteen: String = ""
}

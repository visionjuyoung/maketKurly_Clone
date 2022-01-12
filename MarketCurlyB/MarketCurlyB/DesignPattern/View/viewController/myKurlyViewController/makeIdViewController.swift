//
//  makeIdViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/09.
//

import UIKit

class makeIdViewController: UIViewController {
    
    lazy var dataManager: SignInDataManager = SignInDataManager()
    
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
    }
    
    @IBAction func pressAddButton(_ sender: UIButton) {
        setAddInfoButton()
        sender.backgroundColor = .purple
        sender.isSelected = true
    }
    
    @IBAction func pressAgreeButton(_ sender: UIButton) {
        if sender.isSelected {
            sender.backgroundColor = .white
            sender.isSelected = false
        } else {
            sender.backgroundColor = .purple
            sender.isSelected = true
        }
    }
    
    @IBAction func pressAllButton(_ sender: UIButton) {
        if sender.isSelected == true {
            setAgreeButton()
        } else {
            var buttons: [UIButton] = [allAgree, agree1Btn, agree2Btn,agree3Btn,agree4Btn,agree5Btn, smsBtn, emailBtn]
            for button in buttons {
                button.backgroundColor = .purple
                button.isSelected = true
            }
        }
    }
    
    @IBAction func pressSignInButton(_ sender: UIButton) {
        
        var genderValue: String = ""
        var addValue1: String?
        var addValue2: String?
        var agree1: String = ""
        var agree2: String = ""
        var agree3: String = ""
        var agree4: String = ""
        var agree5: String = ""
        var smsAgree: String = ""
        var emailAgree: String = ""
        
        guard let id = idTextField.text, id != "" else {
            return
        }
        
        guard let password = passwordTextField.text, password != "" else {
            return
        }
        
        guard let checkPassword = checkPasswordTextField.text, checkPassword != password else {
            return
        }
        
        guard let name = nameTextField.text, name != "" else {
            return
        }
        
        guard let email = emailTextField.text, email != "" else {
            return
        }
        
        guard let telNum = telNumTextField.text, telNum != "" else {
            return
        }
        
        guard let year = yearTextField.text, year != "" else {
            return
        }
        
        guard let month = monthTextField.text, month != "" else {
            return
        }
        
        guard let date = dateTextField.text, date != "" else {
            return
        }
        
        if boyBtn.isSelected {
            genderValue = "F"
        } else if girlBtn.isSelected {
            genderValue = "M"
        } else {
            genderValue = ""
        }
        
        if recommendId.isSelected {
            addValue1 = "aaa111"
        } else if eventName.isSelected {
            addValue2 = "-이벤트"
        } else {
            
        }
        
        if allAgree.isSelected {
            agree1 = "Y"
            agree2 = "Y"
            agree3 = "Y"
            smsAgree = "Y"
            emailAgree = "Y"
            agree5 = "Y"
        } else {
            if agree1Btn.isSelected {
                agree1 = "Y"
            } else {
                agree1 = "N"
            }
            
            if agree2Btn.isSelected {
                agree2 = "Y"
            } else {
                agree2 = "N"
            }
            
            if agree3Btn.isSelected {
                agree3 = "Y"
            } else {
                agree3 = "N"
            }
            
            if agree4Btn.isSelected {
                smsAgree = "Y"
                emailAgree = "Y"
            } else {
                smsAgree = "N"
                emailAgree = "N"
            }
            
            if agree5Btn.isSelected {
                agree5 = "Y"
            } else {
                agree5 = "N"
            }
        }
        let input = SignInRequest(name: name, id: id, pwd: password, email: email, phone: telNum, adress: "", exraAdress: "", birthDate: "\(year)\(month)\(date)", gender: genderValue, recommender: addValue1, eventName: addValue2, isTermsOfUseAgree: agree1, isPersonalInfoCollectAgree: agree2, isPersonalInfoUsageAgree: agree3, isSmsReceiveAgree: smsAgree, isEmailReceiveAgree: emailAgree, isAgeAboveForteen: agree5)
        dataManager.postLogIn(input, delegate: self)
    }
    
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension makeIdViewController {
    func didSuccess(_ result: SignInResult) {
        print("회원가입 성공")
    }
    
    func faliedRequest() {
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

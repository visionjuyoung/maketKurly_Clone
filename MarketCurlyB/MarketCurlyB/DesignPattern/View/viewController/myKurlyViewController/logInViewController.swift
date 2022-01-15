//
//  logInViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/09.
//

import UIKit

class logInViewController: UIViewController {
    
    lazy var dataManager: LogInDataManager = LogInDataManager()
    lazy var loadDataManager: LoadUserInfoDataManager = LoadUserInfoDataManager()
    
    let state = LoginState.shared

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var makeIdButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        // Do any additional setup after loading the view.
    }
    
    func setButton() {
        makeIdButton.layer.borderWidth = 1
        makeIdButton.layer.borderColor = UIColor.black.cgColor
        makeIdButton.layer.cornerRadius = 5
        logInButton.layer.cornerRadius = 5
    }
    
    @IBAction func pressLoginButton(_ sender: UIButton) {
        guard let id = idTextField.text, id != "" else {
            let alert = UIAlertController(title: "로그인 실패", message: "아이디를 입력해주세요", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: false, completion: nil)
            return
        }
        
        guard let password = passwordTextField.text, password != "" else {
            let alert = UIAlertController(title: "로그인 실패", message: "비밀번호를 입력해주세요", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: false, completion: nil)
            return
        }
        let input = LoginRequest(id: id, pwd: password)
        dataManager.postLogIn(input, delegate: self)
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func makeIdButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "makeIdViewController") as? makeIdViewController else {
            return
        }
        present(vc, animated: true, completion: nil)
    }
}

extension logInViewController {
    func didsuccessLogIn(_ result: LogInResult) {
        state.Idx = result.userIdx
        state.jwt = result.jwt
        state.state = true
        print(state.Idx)
        print("로그인 성공")
        let userNum = state.Idx - 1
        loadDataManager.loadId(userIdx: userNum, delegate: self)
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
}

extension logInViewController {
    func didSuccessLoadId(_ result: LoadInfoResult) {
        state.name = result.name
        print(state.name)
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "myKurlyViewController") as? myKurlyViewController else {
            return
        }
        present(vc, animated: false, completion: nil)
    }
}

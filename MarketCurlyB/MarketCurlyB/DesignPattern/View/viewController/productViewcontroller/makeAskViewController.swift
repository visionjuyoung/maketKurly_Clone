//
//  makeAskViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import UIKit

class makeAskViewController: UIViewController {
    
    lazy var addAskDataManager = AddAskDataManager()
    
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var sentenceTextField: UITextField!
    @IBOutlet weak var makeButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    let state = LoginState.shared
    let productState = ProductViewState.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productLabel.text = productState.askProductName
        checkButton.layer.borderWidth = 1
        checkButton.layer.borderColor = UIColor.systemGray4.cgColor
        checkButton.layer.cornerRadius = 15
        sentenceTextField.addTarget(self, action: #selector(textFieldDidChange3(_:)), for: .editingChanged)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)

            if let firstVC = presentingViewController as? askViewController {
                DispatchQueue.main.async {
                    firstVC.tableView.reloadData()
                }
            }
        }
    
    @IBAction func makeAsk(_ sender: UIButton) {
        let input = AddAskRequest(userIdx: state.Idx, productIdx: productState.Idx, title: titleTextField.text!, question: sentenceTextField.text!, isLock: "F")
        addAskDataManager.AddAsk(input, delegate: self)
    }
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func textFieldDidChange3(_ sender: Any?) {
            makeButton.layer.backgroundColor = UIColor.purple.cgColor
        
    }
}

extension makeAskViewController {
    func didSuccessAddAsk(result: [AddAskResult]) {
        print("addask 결과 : \(result)")
        dismiss(animated: false, completion: nil)
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "askViewController") as? askViewController else { return }
    }
}

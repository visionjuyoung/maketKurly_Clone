//
//  makeIdViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/09.
//

import UIKit

class makeIdViewController: UIViewController {

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
        var buttons: [UIButton] = [allAgree, agree1Btn, agree2Btn,agree3Btn,agree4Btn,agree5Btn]
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
    
    @IBAction func pressAllButton(_ sender: UIButton) {
        if sender.isSelected == true {
            setAgreeButton()
        } else {
            var buttons: [UIButton] = [allAgree, agree1Btn, agree2Btn,agree3Btn,agree4Btn,agree5Btn]
            for button in buttons {
                button.backgroundColor = .purple
                button.isSelected = true
            }
        }
    }
    
    
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

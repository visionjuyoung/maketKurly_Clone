//
//  myKurlyViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import UIKit

class myKurlyViewController: UIViewController {

    @IBOutlet weak var leftBarBtn: UIBarButtonItem!
    @IBOutlet weak var leftBarBtn2: UIBarButtonItem!
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var gradeButton: UILabel!
    @IBOutlet weak var nextGradeButton: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let state = LoginState.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if state.state {
            testView.isHidden = true
        } else {
            testView.isHidden = false
        }
        print("\(state.name) 2")
        nameLabel.text = state.name
    }
    
    func setButton() {
        gradeButton.layer.cornerRadius = 10
        nextGradeButton.layer.cornerRadius = 10
    }

    @IBAction func PressIdButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "logInViewController") as? logInViewController else {
            return
        }
        present(vc, animated: true, completion: nil)
    }
}

extension myKurlyViewController {
    func setNavigationBar() {
        leftBarBtn.isSelected = false
        leftBarBtn2.isSelected = false
    }
}

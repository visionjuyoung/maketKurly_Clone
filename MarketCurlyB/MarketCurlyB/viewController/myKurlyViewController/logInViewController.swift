//
//  logInViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/09.
//

import UIKit

class logInViewController: UIViewController {

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

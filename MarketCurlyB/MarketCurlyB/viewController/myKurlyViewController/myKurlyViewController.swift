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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

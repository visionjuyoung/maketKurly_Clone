//
//  searchViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import UIKit

class searchViewController: UIViewController {

    @IBOutlet weak var leftBarBtn: UIBarButtonItem!
    @IBOutlet weak var leftBarBtn2: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension searchViewController {
    func setNavigationBar() {
        leftBarBtn.isSelected = false
        leftBarBtn2.isSelected = false
    }
}

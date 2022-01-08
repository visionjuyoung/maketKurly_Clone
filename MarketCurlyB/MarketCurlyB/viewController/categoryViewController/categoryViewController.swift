//
//  categoryViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import UIKit

class categoryViewController: UIViewController {

    @IBOutlet weak var leftBarBtn: UIBarButtonItem!
    @IBOutlet weak var leftBarBtn2: UIBarButtonItem!
    @IBOutlet weak var naviItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigatonBar()
    }
}

extension categoryViewController {
    func setNavigatonBar() {
        leftBarBtn.isSelected = false
        leftBarBtn2.isSelected = false
    }
}

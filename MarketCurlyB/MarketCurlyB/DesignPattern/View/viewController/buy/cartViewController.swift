//
//  cartViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import UIKit

class cartViewController: UIViewController {

    @IBOutlet weak var naviBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
    }
    
    func setInit() {
        naviBar.topItem?.title = "장바구니"
    }
}

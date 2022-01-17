//
//  cartViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import UIKit

class cartViewController: UIViewController {

    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var orderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
    }
    
    func setInit() {
        naviBar.topItem?.title = "장바구니"
        orderButton.layer.cornerRadius = 5
        orderButton.titleLabel?.text = "asd"
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
    
}

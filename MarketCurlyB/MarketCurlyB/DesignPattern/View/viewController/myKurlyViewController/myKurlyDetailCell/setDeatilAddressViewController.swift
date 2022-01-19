//
//  setDeatilAddressViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import UIKit

class setDeatilAddressViewController: UIViewController {
    
    var big: String = ""
    @IBOutlet weak var trxtf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trxtf.placeholder = big
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}

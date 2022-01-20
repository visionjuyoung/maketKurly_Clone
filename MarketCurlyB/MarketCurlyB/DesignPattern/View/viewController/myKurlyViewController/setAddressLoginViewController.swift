//
//  setAddressLoginViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import UIKit

class setAddressLoginViewController: UIViewController {

    @IBOutlet weak var textf: UITextField!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var addressViewlabel: UITextField!
    @IBOutlet weak var detailAddress: UITextField!
    
    let addressmanager = AddAddressModel.shared
    
    var status: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func searchDetail(_ sender: Any) {
        secondView.isHidden = false
        addressViewlabel.placeholder = textf.text
    }
    
    @IBAction func pressEnd(_ sender: Any) {
        guard let firstAddress = addressViewlabel.placeholder else {
            return
        }
        addressmanager.address1 = firstAddress
        guard let secondAddress = detailAddress.text else {
            return
        }
        addressmanager.address2 = secondAddress
        dismiss(animated: false, completion: nil)
    }
    
}

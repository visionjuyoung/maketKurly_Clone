//
//  searchAddressViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import UIKit

class searchAddressViewController: UIViewController {
    
    let addressDataManager = AddAddressModel.shared

    @IBOutlet weak var firstAddress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressNext(_ sender: Any) {
        addressDataManager.address1 = firstAddress.text!
        print("addressDataManager.address1 \(addressDataManager.address1)")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AddDeliveryViewController") as? AddDeliveryViewController else { return }
        vc.address1 = addressDataManager.address1
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

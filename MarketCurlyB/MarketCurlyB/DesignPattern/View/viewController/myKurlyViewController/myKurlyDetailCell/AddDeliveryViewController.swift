//
//  AddDeliveryViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import UIKit

class AddDeliveryViewController: UIViewController {
    
    lazy var datamanger = AddAddressDataManager()
    let addressDataManager = AddAddressModel.shared
    let state = LoginState.shared
    @IBOutlet weak var beforeLabel: UILabel!
    
    var address1 : String = ""
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var firstAddressLabel: UILabel!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var inputText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.layer.cornerRadius = 15
        button2.layer.cornerRadius = 3
        beforeLabel.text = addressDataManager.address1
    }
    
    @IBAction func addAddressButton(_ sender: Any) {
        addressDataManager.address2 = inputText.text!
        let input = AddAddressRequest(userIdx: state.Idx, address: addressDataManager.address1, extraAddress: addressDataManager.address2)
        print("input : \(input)")
        datamanger.AddAddress(input, delegate: self)
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AddDeliveryViewController {
    func didSuccessAddAddress(result: AddAddressResult?) {
        print("추가 결과 : \(result)")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "deliveryViewController") as? deliveryViewController else {return}
        present(vc, animated: true, completion: nil)
    }
}

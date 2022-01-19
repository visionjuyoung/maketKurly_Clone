//
//  setAddressLoginViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import UIKit

class setAddressLoginViewController: UIViewController {

    @IBOutlet weak var textf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func searchDetail(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "setDeatilAddressViewController") as? setDeatilAddressViewController else { return }
        vc.big = textf.text!
        present(vc, animated: false, completion: nil)
    }
    

}

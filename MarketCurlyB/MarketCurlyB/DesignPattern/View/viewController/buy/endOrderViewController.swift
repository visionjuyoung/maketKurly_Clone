//
//  endOrderViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import UIKit

class endOrderViewController: UIViewController {
    
    let state = LoginState.shared

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "\(state.name)의 주문이 완료되었습니다."
        priceLabel.text = "\(total)"
    }
    
    func setInit() {
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.systemGray4.cgColor
        button1.layer.cornerRadius = 3
        
        button2.layer.cornerRadius = 3
    }

    @IBAction func go(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "tabbar") as? UITabBarController else { return }
        present(vc, animated: true, completion: nil)
    }
    @IBAction func seeDetail(_ sender: Any) {
        
    }
}

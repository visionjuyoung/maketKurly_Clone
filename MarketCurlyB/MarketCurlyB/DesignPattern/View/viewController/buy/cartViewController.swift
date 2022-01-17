//
//  cartViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import UIKit

class cartViewController: UIViewController {
    
    let cartsInDataManager: CartInDataManager = CartInDataManager()

    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var orderButton: UIButton!
    
    let loginState = LoginState.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(loginState.Idx)
        print(loginState.jwt)
        setInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartsInDataManager.loadCarts(userIdx: loginState.Idx, delegate: self)
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

extension cartViewController {
    func didSuccessLoadCarts(result: CartsInResult?) {
        
    }
    
    func didSuccessLoadAddress(result: LoadAddressResult) {
        
    }
}

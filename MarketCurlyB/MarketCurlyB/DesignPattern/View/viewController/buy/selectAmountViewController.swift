//
//  selectAmountViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/17.
//

import UIKit

class selectAmountViewController: UIViewController {
    
    let datamanger: LoadProductDataManager = LoadProductDataManager()
    let cartmanager: CartInDataManager = CartInDataManager()
    let sta = ProductViewState.shared
    let us = LoginState.shared
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cartButton: UIButton!
    
    var prName: String = ""
    var price: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
        datamanger.loadProduct(productIdx: sta.Idx, delegate: self)
    }
    
    func setInit() {
        cartButton.layer.cornerRadius = 5
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "selectAmountTableViewCell", bundle: nil), forCellReuseIdentifier: "selectAmountTableViewCell")
    }
    
    @IBAction func gotoCart(_ sender: UIButton) {
        print(us.Idx)
        print(sta.Idx)
        cartmanager.AddCart(userIdx: us.Idx, producIdx: sta.Idx, delegate: self)
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension selectAmountViewController {
    func didSuccessLoadProductInfo(result: LoadProductInfoResult) {
        prName = result.title
        price = result.price
        tableView.reloadData()
    }
    
    func didSuccessAddCart(){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "cartViewController") as? cartViewController else {
            return
        }
        present(vc, animated: true, completion: nil)
    }
}

extension selectAmountViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "selectAmountTableViewCell") as? selectAmountTableViewCell else {
            return UITableViewCell()
        }
        cell.namesLab.text = prName
        cell.priceLab.text = "\(price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

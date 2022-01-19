//
//  cartViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import UIKit

class cartViewController: UIViewController {
    
    let cartsInDataManager: CartInDataManager = CartInDataManager()
    let loadAddressDataManager: LoadAddressDataManager = LoadAddressDataManager()

    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    var colds: [ColdProducts] = []
    var roomtemps: [RoomtempProducts] = []
    var frozen: [FrozenProducts] = []
    var productsInCart: [ProductsTemplate] = []
    var names: String = ""
    
    var totalPrice = 0
    let loginState = LoginState.shared
    let productstate = ProductViewState.shared
    var amount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddressDataManager.loadAddress(userIdx: loginState.Idx, delegate: self)
        cartsInDataManager.loadCarts(cartIdx: loginState.cartId, delegate: self)
        setInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func goToOrder(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "orderViewController") as? orderViewController else { return }
        present(vc, animated: true, completion: nil)
        vc.totalPrice = totalPrice
        vc.productsName = names
    }
    
    
    func setInit() {
        naviBar.topItem?.title = "장바구니"
        orderButton.layer.cornerRadius = 5
        allButton.layer.cornerRadius = 12
        allButton.backgroundColor = .purple
        allButton.isSelected = true
        orderButton.titleLabel?.text = "\(totalPrice) 원 결제"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "productListsTableViewCell", bundle: nil), forCellReuseIdentifier: "productListsTableViewCell")
        tableView.register(UINib(nibName: "totalpriceTableViewCell", bundle: nil), forCellReuseIdentifier: "totalpriceTableViewCell")
    }
    
    @IBAction func selectAllBtn(_ sender: UIButton) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productListsTableViewCell") as? productListsTableViewCell
        
        if allButton.isSelected == false {
            allButton.backgroundColor = .purple
            allButton.isSelected = true
            cell?.chooseButton.backgroundColor = .purple
            cell?.chooseButton.isSelected = true
        } else {
            allButton.backgroundColor = .white
            allButton.isSelected = false
            cell?.chooseButton.backgroundColor = .white
            cell?.chooseButton.isSelected = false
        }
        tableView.reloadData()
    }
    
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
    
}

extension cartViewController {
    func didSuccessLoadCarts(result: CartsInResult?) {
        var num: Int = 0
        guard let res: CartsInResult = result else {
            return
        }
        names = res.coldProducts[0]!.title
        if res.coldProducts.isEmpty == false {
            num = res.coldProducts.count
            for i in 0...num-1{
                colds.append(res.coldProducts[i]!)
                totalPrice += res.coldProducts[i]!.price * res.coldProducts[i]!.productCount
                }
            num = 0
        }
        
        if res.frozenProducts.isEmpty == false {
            num = res.frozenProducts.count
            for i in 0...num-1{
                frozen.append(res.frozenProducts[i]!)
                totalPrice += res.frozenProducts[i]!.price
            }
            num = 0
        }
        
        if res.roomTempProducts.isEmpty == false {
            num = res.roomTempProducts.count
            for i in 0...num-1{
                roomtemps.append(res.roomTempProducts[i]!)
                totalPrice += res.roomTempProducts[i]!.price
            }
            num = 0
        }
        orderButton.titleLabel?.text = "\(totalPrice) 원"
        tableView.reloadData()
    }
    
    func didSuccessLoadAddress(result: LoadAddressResult) {
        addressLabel.text = result.address
        loginState.address = result.address
    }
    
    func didSuccessdeleteAll() {
        totalPrice = 0
        colds = []
        cartsInDataManager.loadCarts(cartIdx: loginState.cartId, delegate: self)
    }
    
    func didSuccessdelete() {
        totalPrice = 0
        colds = []
        cartsInDataManager.loadCarts(cartIdx: loginState.cartId, delegate: self)
    }
}

extension cartViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return colds.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productListsTableViewCell") as? productListsTableViewCell else {
                return UITableViewCell()
            }
            cell.productName.text = colds[indexPath.row].title
            cell.productSubTitle.text = colds[indexPath.row].title
            cell.priceLabel.text = "\(colds[indexPath.row].price)원"
            cell.setImage(url: colds[indexPath.row].profileImgUrl)
            cell.amountLabel.text = "\(colds[indexPath.row].productCount)"
            cell.amount = colds[indexPath.row].productCount
            amount = colds[indexPath.row].productCount
            cell.cartIdx = loginState.cartId
            cell.userIdx = loginState.Idx
            cell.productIdx = colds[indexPath.row].productIdx
            cell.minusButton.addTarget(self, action: #selector(pressBtn(_button:)), for: .touchUpInside)
            cell.deleteAllButton.addTarget(self, action: #selector(pressDeleteAllBtn(_button:)), for: .touchUpInside)
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "totalpriceTableViewCell") as? totalpriceTableViewCell else {
                return UITableViewCell()
            }
            cell.pricelab.text = "\(totalPrice) 원"
            cell.totalPriceLab.text = "\(totalPrice) 원"
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        } else {
            return 280
        }
    }
    
    @objc func pressBtn(_button: UIButton) {
        cartsInDataManager.DeleateOneNum(cartIdx: loginState.cartId, producIdx: productstate.deleteNum, delegate: self)
    }
    
    @objc func pressDeleteAllBtn(_button: UIButton) {
        cartsInDataManager.DeleateAll(cartIdx: loginState.cartId, producIdx: productstate.deleteAllNum, delegate: self)
    }
}

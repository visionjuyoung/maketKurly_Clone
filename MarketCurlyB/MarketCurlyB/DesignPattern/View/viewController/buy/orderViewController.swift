//
//  orderViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import UIKit

class orderViewController: UIViewController {
    
    let orderManager = OrderDataManager()
    
    let loginManager = LoginState.shared
    
    var addres: String = ""
    var productsName: String = ""
    var totalPrice: Int = 0
    var clientName: String = ""
    var clientPhone: String = ""

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
        print(loginManager.name)
        print(loginManager.Idx)
        print(loginManager.jwt)
        print(loginManager.address)
        print(loginManager.cartId)
        print(loginManager.phone)
        tableView.reloadData()
    }
    
    func setInit() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "orderOnesTableViewCell", bundle: nil), forCellReuseIdentifier: "orderOnesTableViewCell")
        tableView.register(UINib(nibName: "orderTwoTableViewCell", bundle: nil), forCellReuseIdentifier: "orderTwoTableViewCell")
        tableView.register(UINib(nibName: "orderThreeTableViewCell", bundle: nil), forCellReuseIdentifier: "orderThreeTableViewCell")
        tableView.register(UINib(nibName: "orderFourTableViewCell", bundle: nil), forCellReuseIdentifier: "orderFourTableViewCell")
        tableView.register(UINib(nibName: "orderFiveTableViewCell", bundle: nil), forCellReuseIdentifier: "orderFiveTableViewCell")
        tableView.register(UINib(nibName: "orderSixTableViewCell", bundle: nil), forCellReuseIdentifier: "orderSixTableViewCell")
        tableView.register(UINib(nibName: "orderSevenTableViewCell", bundle: nil), forCellReuseIdentifier: "orderSevenTableViewCell")
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
}

extension orderViewController {
    func didSuccessOrder(result: OrderResult?) {
        print(result?.orderIdx)
    }
}

extension orderViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderOnesTableViewCell") as? orderOnesTableViewCell else {
                return UITableViewCell()
            }
            cell.productsLabel.text = productsName
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderTwoTableViewCell") as? orderTwoTableViewCell else {
                return UITableViewCell()
            }
            cell.customerInfoLabel.text = "\(loginManager.name),\(loginManager.phone)"
            return cell
        }else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderThreeTableViewCell") as? orderThreeTableViewCell else {
                return UITableViewCell()
            }
            cell.addressLabel.text = addres
            return cell
        }else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderFourTableViewCell") as? orderFourTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }else if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderFiveTableViewCell") as? orderFiveTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }else if indexPath.section == 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSixTableViewCell") as? orderSixTableViewCell else {
                return UITableViewCell()
            }
            cell.orderPayLabel.text = "\(totalPrice) 원"
            cell.orderpayLabel2.text = "\(totalPrice) 원"
            cell.totalPayLabel.text = "\(totalPrice) 원"
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSevenTableViewCell") as? orderSevenTableViewCell else {
                return UITableViewCell()
            }
            cell.orderButton.titleLabel?.text = "\(totalPrice)원 결제하기"
            tableView.reloadData()
            cell.orderButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        } else if indexPath.section == 1 {
            return 70
        }else if indexPath.section == 2 {
            return 150
        }else if indexPath.section == 3 {
            return 250
        }else if indexPath.section == 4 {
            return 250
        }else if indexPath.section == 5 {
            return 380
        }else{
            return 420
        }
    }
    
    @objc func pressButton(_ button: UIButton) {
        print("Button with tag: \(button.tag) clicked in cell!")
        let input = OrderRequest(userIdx: loginManager.Idx, cartIdx: loginManager.cartId, paymentType: 1, couponUserIdx: 1, productPrice: totalPrice, discountPrice: 0, deliveryPrice: 0, couponDiscount: 0, rewardDiscount: 0, amountOfPayment: totalPrice)
        orderManager.didOrder(input, delegate: self)
    }
}

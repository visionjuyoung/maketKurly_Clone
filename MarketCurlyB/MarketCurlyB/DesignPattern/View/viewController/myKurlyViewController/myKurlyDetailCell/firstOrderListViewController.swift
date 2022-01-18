//
//  firstOrderListViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import UIKit

class firstOrderListViewController: UIViewController {
    
    let totalDatamanager = TotalOrderDataManager()
    let datamanager = LoginState.shared
    @IBOutlet weak var tableView: UITableView!
    
    var info: [TotalOrderResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalDatamanager.loadTotalOrder(userIdx: datamanager.Idx, delegate: self)
        // Do any additional setup after loading the view.
        setInit()
    }
    
    func setInit() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "orderListsTableViewCell", bundle: nil), forCellReuseIdentifier: "orderListsTableViewCell")
    }

}

extension firstOrderListViewController {
    func didSuccessLoadTotals(result: [TotalOrderResult]) {
        print(result)
        info = result
        tableView.reloadData()
    }
}

extension firstOrderListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderListsTableViewCell") as? orderListsTableViewCell else {
            return UITableViewCell()
        }
        cell.orderNumLabel.text = "주문번호 \(info[indexPath.row].orderIdx)"
        cell.productNameLabel.text = info[indexPath.row].title
        cell.dateLabel.text = info[indexPath.row].paymentDate
        if info[indexPath.row].paymentDate == "CARD" {
            cell.howtoLabel.text = "신용카드"
        } else {
            cell.howtoLabel.text = "휴대폰"
        }
        if info[indexPath.row].deliveryStatus == "PREPARING" {
            cell.stateLabel.text = "배송준비"
        } else {
            cell.stateLabel.text = "배송완료"
        }
        cell.priceLabel.text = "\(info[indexPath.row].amountOfPayment)원"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
}

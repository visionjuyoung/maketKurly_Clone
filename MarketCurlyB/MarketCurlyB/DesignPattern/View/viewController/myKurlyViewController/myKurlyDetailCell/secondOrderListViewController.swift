//
//  secondOrderListViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import UIKit

class secondOrderListViewController: UIViewController {
    
    let userDataManager = LoginState.shared
    let datamanager = OftenProductDataManager()
    @IBOutlet weak var tableView: UITableView!
    
    var cellNum: Int = 0
    
    var info: [OftenProductResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datamanager.loadOftenProducts(userIdx: userDataManager.Idx, delegate: self)
        // Do any additional setup after loading the view.
        setInit()
    }

    func setInit() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "oftensTableViewCell", bundle: nil), forCellReuseIdentifier: "oftensTableViewCell")
    }
}

extension secondOrderListViewController {
    func didSuccessLoadOftens(result: [OftenProductResult]) {
        info = result
        tableView.reloadData()
    }
}

extension secondOrderListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "oftensTableViewCell") as? oftensTableViewCell else {
            return UITableViewCell()
        }
        cell.productimage.load(urlString: info[indexPath.row].profileImageUrl)
        cell.productName.text = info[indexPath.row].title
        cell.price.text = "\(info[indexPath.row].price)원"
        cell.num.text = "\(info[indexPath.row].count)회"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}

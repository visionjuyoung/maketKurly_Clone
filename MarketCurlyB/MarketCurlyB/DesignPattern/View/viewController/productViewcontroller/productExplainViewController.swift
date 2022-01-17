//
//  productExplainViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import UIKit

class productExplainViewController: UIViewController {
    
    let loadProductInfoDataManager: LoadProductDataManager = LoadProductDataManager()
    
    let productViewInfo = ProductViewState.shared
    
    var info: LoadProductInfoResult?
    
    var nametitle: String = ""
    var subtitle: String = ""
    var price: Int = 0
    var url: String = ""

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProductInfoDataManager.loadProduct(productIdx: productViewInfo.Idx, delegate: self)
        setTableView()
        
    }
    
    func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "productExplainOneTableViewCell", bundle: nil), forCellReuseIdentifier: "productExplainOneTableViewCell")
        tableView.register(UINib(nibName: "productExplainTwoTableViewCell", bundle: nil), forCellReuseIdentifier: "productExplainTwoTableViewCell")
    }
}

extension productExplainViewController {
    func didSuccessLoadProductInfo(result: LoadProductInfoResult) {
        
        nametitle = result.title
        subtitle = result.subTitle
        price = result.price
        url = result.profileImgUrl
        
        self.tableView.reloadData()
    }
}

extension productExplainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productExplainOneTableViewCell") as? productExplainOneTableViewCell else { return UITableViewCell()}
            cell.productExplainTitle.text = nametitle
            cell.productExplainSubTitle.text = subtitle
            cell.productExplainPrice.text = "\(price)"
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productExplainTwoTableViewCell") as? productExplainTwoTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 750
        } else {
            return 500
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}

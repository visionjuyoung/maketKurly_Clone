//
//  deliveryViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import UIKit

class deliveryViewController: UIViewController {
    
    lazy var addressDataManager = LoadAddressDataManager()
    let state = LoginState.shared
    
    var info : [LoadAddressResult] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addressDataManager.loadAddress(userIdx: state.Idx, delegate: self)
        setInit()
    }
    
    func setInit() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "deliverTableViewCell", bundle: nil), forCellReuseIdentifier: "deliverTableViewCell")
    }
    
    @IBAction func goToSearch(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "searchAddressViewController") as? searchAddressViewController else { return }
        present(vc, animated: true, completion: nil)
    }
    

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension deliveryViewController {
    func didsuccessLoadAddress(result: [LoadAddressResult]) {
        info = result
        tableView.reloadData()
    }
}

extension deliveryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deliverTableViewCell") as? deliverTableViewCell else {
            return UITableViewCell()
        }
        cell.isDefault = info[indexPath.row].isDefaultAddress
        cell.deliveryInfoIdx = info[indexPath.row].deliveryInfoIdx
        cell.addressLabel.text = "\(info[indexPath.row].address)"
        cell.button.layer.borderWidth = 1
        cell.button.layer.cornerRadius = 15
        if cell.isDefault != "T" {
            cell.button.layer.borderColor = UIColor.systemGray4.cgColor
            cell.button.layer.backgroundColor = UIColor.white.cgColor
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

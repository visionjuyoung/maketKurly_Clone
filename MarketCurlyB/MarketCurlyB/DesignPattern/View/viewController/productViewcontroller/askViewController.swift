//
//  askViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import UIKit

class askViewController: UIViewController {
    
    @IBOutlet weak var productInquiry: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        setTableView()
    }
    
    func setButton() {
        productInquiry.layer.borderWidth = 1
        productInquiry.layer.borderColor = UIColor.black.cgColor
        productInquiry.layer.cornerRadius = 5
    }
    
    func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "questionTableViewCell", bundle: nil), forCellReuseIdentifier: "questionTableViewCell")
        tableView.register(UINib(nibName: "questionTableViewTableViewCell", bundle: nil), forCellReuseIdentifier: "questionTableViewTableViewCell")
    }
}

extension askViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 20
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "questionTableViewCell") as? questionTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "questionTableViewTableViewCell") as? questionTableViewTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else {
            return 90
        }
    }
}

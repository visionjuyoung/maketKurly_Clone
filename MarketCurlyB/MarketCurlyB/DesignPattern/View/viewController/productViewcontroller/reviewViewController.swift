//
//  reviewViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import UIKit

class reviewViewController: UIViewController {

    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        setTableView()
    }
    
    func setButton() {
        reviewButton.layer.borderWidth = 1
        reviewButton.layer.borderColor = UIColor.black.cgColor
        reviewButton.layer.cornerRadius = 5
    }

    func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "productReviewOneTableViewCell", bundle: nil), forCellReuseIdentifier: "productReviewOneTableViewCell")
        tableView.register(UINib(nibName: "productReviewsTableViewCell", bundle: nil), forCellReuseIdentifier: "productReviewsTableViewCell")
    }
}

extension reviewViewController: UITableViewDataSource, UITableViewDelegate {
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productReviewOneTableViewCell") as? productReviewOneTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productReviewsTableViewCell") as? productReviewsTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else {
            return 70
        }
    }
}

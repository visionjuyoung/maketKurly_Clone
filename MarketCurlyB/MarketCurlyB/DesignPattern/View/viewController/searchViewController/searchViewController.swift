//
//  searchViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import UIKit

class searchViewController: UIViewController {

    @IBOutlet weak var leftBarBtn: UIBarButtonItem!
    @IBOutlet weak var leftBarBtn2: UIBarButtonItem!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
    }
    
    func setInit() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "eventSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "eventSearchTableViewCell")
        tableView.register(UINib(nibName: "recommandSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "recommandSearchTableViewCell")
        tableView.register(UINib(nibName: "recentUpTableViewCell", bundle: nil), forCellReuseIdentifier: "recentUpTableViewCell")
    }
    
    @IBAction func touchDown(_ sender: UITextField) {
        let spacing: CGFloat = 70.0
        leftConstraint.constant = spacing
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func cancleButton(_ sender: UIButton) {
        let spacing: CGFloat = 20.0
        leftConstraint.constant = spacing
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}

extension searchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventSearchTableViewCell") as? eventSearchTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "recommandSearchTableViewCell") as? recommandSearchTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "recentUpTableViewCell") as? recentUpTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 150
        } else if indexPath.section == 1 {
            return 150
        } else {
            return 530
        }
    }
}

extension searchViewController {
    func setNavigationBar() {
        leftBarBtn.isSelected = false
        leftBarBtn2.isSelected = false
    }
}

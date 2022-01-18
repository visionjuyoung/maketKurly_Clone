//
//  myKurlyViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import UIKit

class myKurlyViewController: UIViewController {

    @IBOutlet weak var leftBarBtn: UIBarButtonItem!
    @IBOutlet weak var leftBarBtn2: UIBarButtonItem!
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var gradeButton: UILabel!
    @IBOutlet weak var nextGradeButton: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    let loginInfo: LogInPageCellTitleInfo = LogInPageCellTitleInfo()
    
    let state = LoginState.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(state.jwt)
        setButton()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if state.state {
            testView.isHidden = true
            tableViewHeight.constant = 1050
        } else {
            testView.isHidden = false
        }
        print("\(state.name) 2")
        nameLabel.text = state.name
        tableView1.reloadData()
    }
    
    func setTableView() {
        tableView1.dataSource = self
        tableView1.delegate = self
        tableView1.register(UINib(nibName: "myKurlyListTableViewCell", bundle: nil), forCellReuseIdentifier: "myKurlyListTableViewCell")
    }
    
    func setButton() {
        gradeButton.layer.cornerRadius = 10
        nextGradeButton.layer.cornerRadius = 10
    }

    @IBAction func PressIdButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "logInViewController") as? logInViewController else {
            return
        }
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func goToCart(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "cartViewController") as? cartViewController else { return }
        present(vc, animated: false, completion: nil)
    }
    
}

extension myKurlyViewController {
    func setNavigationBar() {
        leftBarBtn.isSelected = false
        leftBarBtn2.isSelected = false
    }
}

extension myKurlyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if state.state == true {
            return 6
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if state.state == true {
            switch section {
            case 0:
                return loginInfo.login.logInSection1.count
            case 1:
                return loginInfo.login.logInSection2.count
            case 2:
                return loginInfo.login.logInSection3.count
            case 3:
                return loginInfo.login.logInSection4.count
            case 4:
                return loginInfo.login.logInSection5.count
            case 5:
                return loginInfo.login.logInSection6.count
            default:
                return 0
            }
        } else {
            switch section {
            case 0:
                return loginInfo.logout.logOutSection1.count
            case 1:
                return loginInfo.logout.logOutSection2.count
            default:
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyListTableViewCell") as? myKurlyListTableViewCell else { return UITableViewCell() }
        
        if state.state == true {
            switch indexPath.section {
            case 0:
                cell.listNameLabel.text = loginInfo.login.logInSection1[indexPath.row]
            case 1:
                cell.listNameLabel.text = loginInfo.login.logInSection2[indexPath.row]
            case 2:
                cell.listNameLabel.text = loginInfo.login.logInSection3[indexPath.row]
            case 3:
                cell.listNameLabel.text = loginInfo.login.logInSection4[indexPath.row]
            case 4:
                cell.listNameLabel.text = loginInfo.login.logInSection5[indexPath.row]
            case 5:
                cell.listNameLabel.text = loginInfo.login.logInSection6[indexPath.row]
            default:
                return UITableViewCell()
            }
        } else {
            switch indexPath.section {
            case 0:
                cell.listNameLabel.text = loginInfo.logout.logOutSection1[indexPath.row]
            case 1:
                cell.listNameLabel.text = loginInfo.logout.logOutSection2[indexPath.row]
            default:
                return UITableViewCell()
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if state.state == true {
            if indexPath.section == 1 {
                if indexPath.row == 0 {
                    
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
}

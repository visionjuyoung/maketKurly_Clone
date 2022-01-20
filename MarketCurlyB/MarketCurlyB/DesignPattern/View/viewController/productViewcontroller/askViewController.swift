//
//  askViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import UIKit

class askViewController: UIViewController {
    
    lazy var loadAskDataManager = LoadAskDataManager()
    let productViewInfo = ProductViewState.shared
    
    @IBOutlet weak var productInquiry: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let names:[String] = ["김*영", "곽*형" ,"김*범", "윤*범", "조*연", "박*수", "유*석", "명*만"]
    
    var info:[LoadAskResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        setTableView()
        loadAskDataManager.loadAsk(productIdx: productViewInfo.Idx, delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadAskDataManager.loadAsk(productIdx: productViewInfo.Idx, delegate: self)
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
    
    @IBAction func goToAsk(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "makeAskViewController") as? makeAskViewController else { return }
        present(vc, animated: true, completion: nil)
    }
    
}

extension askViewController {
    func didSuccessLoadAsk(result: [LoadAskResult]) {
        info = result
        print(result)
        self.tableView.reloadData()
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
            return info.count
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
            cell.questionTitle.text = info[indexPath.row].title
            cell.questionDate.text = info[indexPath.row].createDate
            cell.questionName.text = names[(info.count-1)-indexPath.row]
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

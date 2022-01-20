//
//  firstHomeViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import UIKit

class firstHomeViewController: UIViewController {
    
    let loadSectionDataManager = LoadSectionDataManager()

    let picks: [String] = ["Kurlys Only", "인기 신상품", "마감 세일", "후기 100개 돌파"]
    
    let new = NewProducts()
    
    var sectionsCount: [Int] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
        loadSectionDataManager.loadSectionProduct(section: 1, delegate: self)
        loadSectionDataManager.loadSectionProduct(section: 2, delegate: self)
        loadSectionDataManager.loadSectionProduct(section: 3, delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func setInit() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "bannerTableViewCell", bundle: nil), forCellReuseIdentifier: "bannerTableViewCell")
        tableView.register(UINib(nibName: "kurlyRecommandTableViewCell", bundle: nil), forCellReuseIdentifier: "kurlyRecommandTableViewCell")
        tableView.register(UINib(nibName: "middlesTableViewCell", bundle: nil), forCellReuseIdentifier: "middlesTableViewCell")
        tableView.separatorStyle = .none
    }
}

extension firstHomeViewController {
    func didSuccessLoadAllSection(result: [LoadSectionResult]) {
        print(result)
    }
    
    func didSuccessLoadSection(result: [LoadSectionResult]) {
        sectionsCount.append(result.count)
        print(sectionsCount)
    }
}

extension firstHomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "bannerTableViewCell") as? bannerTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        } else {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "kurlyRecommandTableViewCell") as? kurlyRecommandTableViewCell else {
                    return UITableViewCell()
                }
                cell.nameLAbel.text = picks[indexPath.row]
                cell.sectionNum = 0
                return cell
            } else if indexPath.row == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "kurlyRecommandTableViewCell") as? kurlyRecommandTableViewCell else {
                    return UITableViewCell()
                }
                cell.nameLAbel.text = picks[indexPath.row]
                cell.sectionNum = 1
                return cell
            } else if indexPath.row == 2 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "kurlyRecommandTableViewCell") as? kurlyRecommandTableViewCell else {
                    return UITableViewCell()
                }
                cell.nameLAbel.text = picks[indexPath.row]
                cell.sectionNum = 2
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "middlesTableViewCell") as? middlesTableViewCell else {
                    return UITableViewCell()
                }
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 350
        } else {
            if indexPath.row == 3 {
                return 660
            } else {
            return 330
            }
        }
    }
}

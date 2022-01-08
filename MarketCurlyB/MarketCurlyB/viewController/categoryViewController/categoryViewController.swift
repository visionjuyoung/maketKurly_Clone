//
//  categoryViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import UIKit
import ExpyTableView

class categoryViewController: UIViewController {

    @IBOutlet weak var leftBarBtn: UIBarButtonItem!
    @IBOutlet weak var leftBarBtn2: UIBarButtonItem!
    @IBOutlet weak var naviItem: UINavigationItem!
    @IBOutlet weak var expandableTableView: ExpyTableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let categoryListModel: CategotyList = CategotyList()
    let categoryViewModel = CategoryCollectionModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        expandableTableView.delegate = self
        expandableTableView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        setNavigatonBar()
    }
}

extension categoryViewController {
    func setNavigatonBar() {
        leftBarBtn.isSelected = false
        leftBarBtn2.isSelected = false
    }
}

extension categoryViewController: ExpyTableViewDataSource, ExpyTableViewDelegate {
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        let cell = categoryTableViewCell()
        cell.selectionStyle = .none
        
        if section == 0 {
            cell.textLabel?.text = "설 선물세트"
        } else if section == 1 {
            cell.textLabel?.text = "채소"
        }else if section == 2 {
            cell.textLabel?.text = "과일·견과·쌀"
        }else if section == 3 {
            cell.textLabel?.text = "수산·해산·건어물"
        }else if section == 4 {
            cell.textLabel?.text = "정육·계란"
        }else if section == 5 {
            cell.textLabel?.text = "국·반찬·메인요리"
        }else if section == 6 {
            cell.textLabel?.text = "샐러드·간편식"
        }else if section == 7 {
            cell.textLabel?.text = "면·양념·오일"
        }else if section == 8 {
            cell.textLabel?.text = "생수·음료·우유·커피"
        }else if section == 9 {
            cell.textLabel?.text = "간식·과자·떡"
        }else if section == 10 {
            cell.textLabel?.text = "베이커리·치즈·델리"
        }else if section == 11 {
            cell.textLabel?.text = "건강식품"
        }else if section == 12 {
            cell.textLabel?.text = "전통주"
        }else if section == 13 {
            cell.textLabel?.text = "생활용품·리빙·캠핑"
        }else if section == 14 {
            cell.textLabel?.text = "스킨케어·메이크업"
        }else if section == 15 {
            cell.textLabel?.text = "헤어·바디·구강"
        }else if section == 16 {
            cell.textLabel?.text = "주방용품"
        }else if section == 17 {
            cell.textLabel?.text = "가전제품"
        }else if section == 18 {
            cell.textLabel?.text = "베이비·키즈·완구"
        }
        return cell
    }
    
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        switch state {
            case .willExpand:
            print("WILL EXPAND")
            case .willCollapse:
            print("WILL COLLAPSE")
            case .didExpand:
            print("DID EXPAND")
            case .didCollapse:
            print("DID COLLAPSE")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return categoryListModel.arraySection0.count
        } else if section == 1{
            return categoryListModel.arraySection1.count
        } else {
            return categoryListModel.arraySection2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.backgroundColor = .systemGray6
        cell.selectionStyle = .none
                
        if indexPath.section == 0 {
            cell.textLabel?.text = categoryListModel.arraySection0[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = categoryListModel.arraySection1[indexPath.row]
        } else {
            cell.textLabel?.text = categoryListModel.arraySection2[indexPath.row]
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 19
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           if indexPath.row == 0 {
               return 50
           }else {
               return 40
           }
       }
}

extension categoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryViewModel.numberOfCategoryCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        let collection = categoryViewModel.returnList(at: indexPath.item)
        cell.update(info: collection)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemGray6.cgColor
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 5
            
        let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2
        let height: CGFloat = width + textAreaHeight
        return CGSize(width: width, height: height)
    }
}

class GridCell : UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(info: CategoryCollectionInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
    }
}



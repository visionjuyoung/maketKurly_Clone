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
    @IBOutlet weak var tableView: ExpyTableView!
    
    let categoryListModel: CategotyList = CategotyList()
    let categoryViewModel = CategoryCollectionModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "categoryTableViewCell", bundle: nil), forCellReuseIdentifier: "categoryTableViewCell")
        expandableTableView.delegate = self
        expandableTableView.dataSource = self
        tableView.separatorStyle = .none
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryTableViewCell") as? categoryTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        
        if section == 0 {
            cell.setData(data: categoryListModel.arrayList[0])
        } else if section == 1 {
            cell.setData(data: categoryListModel.arrayList[1])
        }else if section == 2 {
            cell.setData(data: categoryListModel.arrayList[2])
        }else if section == 3 {
            cell.setData(data: categoryListModel.arrayList[3])
        }else if section == 4 {
            cell.setData(data: categoryListModel.arrayList[4])
        }else if section == 5 {
            cell.setData(data: categoryListModel.arrayList[5])
        }else if section == 6 {
            cell.setData(data: categoryListModel.arrayList[6])
        }else if section == 7 {
            cell.setData(data: categoryListModel.arrayList[7])
        }else if section == 8 {
            cell.setData(data: categoryListModel.arrayList[8])
        }else if section == 9 {
            cell.setData(data: categoryListModel.arrayList[9])
        }else if section == 10 {
            cell.setData(data: categoryListModel.arrayList[10])
        }else if section == 11 {
            cell.setData(data: categoryListModel.arrayList[11])
        }else if section == 12 {
            cell.setData(data: categoryListModel.arrayList[12])
        }else if section == 13 {
            cell.setData(data: categoryListModel.arrayList[13])
        }else if section == 14 {
            cell.setData(data: categoryListModel.arrayList[14])
        }else if section == 15 {
            cell.setData(data: categoryListModel.arrayList[15])
        }else if section == 16 {
            cell.setData(data: categoryListModel.arrayList[16])
        }else if section == 17 {
            cell.setData(data: categoryListModel.arrayList[17])
        }else if section == 18 {
            cell.setData(data: categoryListModel.arrayList[18])
        }else if section == 19 {
            cell.setData(data: categoryListModel.arrayList[19])
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
        return 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as? detailViewController else {
            return
        }
        vc.section = indexPath.section
        vc.row = indexPath.row
        print(indexPath.section)
        print(indexPath.row)
        if indexPath.row != 0 {
            present(vc, animated: true, completion: nil)
        }
    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reusableCell", for: indexPath)
            return headerView
        default:
            assert(false)
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 20
        //let textAreaHeight: CGFloat = 10

        let width: CGFloat = (collectionView.bounds.width - itemSpacing - 40)/2
        let height: CGFloat = width
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



//
//  firthHomeViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import UIKit

class firthHomeViewController: UIViewController {
    
    let datamanager = LoadSectionDataManager()
    var data: [LoadSectionResult] = []
    let dumy = Dummys()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
        datamanager.loadSectionProductAll(section: 1, delegate: self)
    }
    
    func setInit() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension firthHomeViewController {
    func didSuccessLoadAll(result: [LoadSectionResult]) {
        print(result)
//        data = result
//        collectionView.reloadData()
    }
}

extension firthHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dumy.name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "alddelShopCell", for: indexPath) as? alddelShopCell else {
            return UICollectionViewCell()
        }
        cell.alddelImage.image = UIImage(named: "\(dumy.name[indexPath.row])")
        cell.alddelName.text = dumy.name[indexPath.row]
        cell.persent.text = "\(dumy.sale[indexPath.row])%"
        cell.price.text = "\(dumy.price[indexPath.row])원"
        cell.onePrice.text = "\(dumy.sum[indexPath.row])원"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "alddelHeaderView", for: indexPath)
            return headerView
        default:
            assert(false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemspacing: CGFloat = 10
        let width: CGFloat = (collectionView.bounds.width - itemspacing - 40)/2
        let height: CGFloat = width * 320/160
        return CGSize(width: width, height: height)
    }
}

class alddelShopCell: UICollectionViewCell {
    @IBOutlet weak var alddelImage: UIImageView!
    @IBOutlet weak var alddelName: UILabel!
    @IBOutlet weak var persent: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var onePrice: UILabel!
    
    
}

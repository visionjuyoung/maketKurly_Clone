//
//  thirdHomeViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import UIKit

class thirdHomeViewController: UIViewController {
    
    let loadProductDataManaget = LoadProductDataManager()
    
    let bestProduct: BestProducts = BestProducts()
    let productInfo = ProductViewState.shared

    @IBOutlet weak var collectionView: UICollectionView!
    
    let new = NewProducts()
    var sectionNum: Int = 2
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setCollectionView()
    }
    
    func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension  thirdHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestProduct.productName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bestProductCell", for: indexPath) as? bestProductCell else {
            return UICollectionViewCell()
        }
        cell.imgView.image = UIImage(named: "\(bestProduct.name[indexPath.row])")
        cell.nameLabel.text = bestProduct.productName[indexPath.row]
        cell.priceLabel.text = bestProduct.price[indexPath.row]
        if bestProduct.onlyState[indexPath.row] == false {
            cell.markLabel.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemspacing: CGFloat = 10
        
        let width: CGFloat = (collectionView.bounds.width - itemspacing - 40)/2
        let height: CGFloat = width * 320/160
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "bestProductHeaderCell", for: indexPath)
                return headerView
            default:
                assert(false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "productViewController") as? productViewController else {
             return
        }
        vc.productIdx = bestProduct.idx[indexPath.row]
        vc.productName = bestProduct.productName[indexPath.row]
        productInfo.Idx = bestProduct.idx[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
}

class bestProductCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var markLabel: UILabel!
    
}

class bestProductHeaderCell: UICollectionReusableView {
    
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var chevornImg: UIImageView!
    
}

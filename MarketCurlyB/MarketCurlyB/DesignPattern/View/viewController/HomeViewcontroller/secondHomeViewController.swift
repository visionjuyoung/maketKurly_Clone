//
//  secondHomeViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import UIKit

class secondHomeViewController: UIViewController {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension secondHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell else {
            return UICollectionViewCell()
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
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "bannerCell1", for: indexPath)
                return headerView
            default:
                assert(false)
        }
    }

}

class selectView: UICollectionReusableView {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var chevronView: UIImageView!
    @IBOutlet weak var filterLabel: UILabel!
    
}

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    
    
}

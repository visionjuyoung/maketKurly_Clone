//
//  productViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import UIKit
import Tabman
import Pageboy

class productViewController: TabmanViewController {
    
    let loadProductInfoDataManager = LoadProductDataManager()
    let heatmanager = HeartDataManager()
    let manager = LoginState.shared
    let productState = ProductViewState.shared

    @IBOutlet weak var tempView: UIView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var naviItem: UINavigationItem!
    @IBOutlet weak var naviBar: UINavigationBar!
    
    var productIdx: Int = 0
    var productName: String = ""
    var jjimm: Int = 0
    
    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviBar.topItem?.title = productName
        productState.askProductName = productName
        setTabman()
        setTabManBar()
        setButton()
        print(productIdx)
        print(manager.jwt)
    }
    
    func setTabman() {
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "productExplainViewController") as! productExplainViewController
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "productDetailViewController") as! productDetailViewController
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "reviewViewController") as! reviewViewController
        let vc4 = storyboard?.instantiateViewController(withIdentifier: "askViewController") as! askViewController
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        viewControllers.append(vc4)
    }
    
    func setTabManBar() {
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.backgroundView.style = .clear
        bar.backgroundColor = .white
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        bar.buttons.customize{(button) in
            button.tintColor = .lightGray
            button.selectedTintColor = UIColor(named: "KurlyColor")
            button.font = UIFont.systemFont(ofSize: 14)
        }
        bar.indicator.tintColor = UIColor(named: "KurlyColor")
        addBar(bar, dataSource: self, at: .custom(view: tempView, layout: nil))
    }
    
    func setButton() {
        heartButton.layer.borderWidth = 1
        heartButton.layer.borderColor = UIColor.systemGray5.cgColor
        heartButton.layer.cornerRadius = 5
        
        buyButton.layer.cornerRadius = 5
    }
    
    @IBAction func goToCart(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "cartViewController") as? cartViewController else { return }
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func addHeart(_ sender: UIButton) {
        let inputs = HeartRequest(userIdx: manager.Idx, productIdx: productIdx)
        heatmanager.didHeart(inputs, delegate: self)
    }
    
    @IBAction func addCart(_ sender: UIButton) {
        performSegue(withIdentifier: "selectSegue", sender: nil)
    }
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        dismiss(animated: false)
    }
    
}

extension productViewController {
    func didSuccessHeart(result: HeartResult?) {
        jjimm = 1
        let alert = UIAlertController(title: "찜 완료", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: false, completion: nil)
    }
    
    func alredy() {
        jjimm = 2
        let alert = UIAlertController(title: "이미 찜한 물품입니다", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: false, completion: nil)
    }
}

extension productViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        switch index {
        case 0:
            return viewControllers[0]
        case 1:
            return viewControllers[1]
        case 2:
            return viewControllers[2]
        case 3:
            return viewControllers[3]
        default:
            return UIViewController()
        }
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "상품설명")
        case 1:
            return TMBarItem(title: "상세정보")
        case 2:
            return TMBarItem(title: "후기")
        case 3:
            return TMBarItem(title: "문의")
        default:
            return TMBarItem(title: "")
        }
    }
    
    
}

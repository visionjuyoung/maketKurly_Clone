//
//  HomeViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import UIKit
import Tabman
import Pageboy

class HomeViewController: TabmanViewController {

    @IBOutlet weak var tabmanView: UIView!
    @IBOutlet weak var naviItem: UINavigationItem!
    @IBOutlet weak var leftBarBtn: UIBarButtonItem!
    @IBOutlet weak var leftBarBtn2: UIBarButtonItem!
    @IBOutlet weak var locationButton: UIBarButtonItem!
    
    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewController()
        setTabManBar()
        setNavi()
    }
    
    @IBAction func goToCart(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "cartViewController") as? cartViewController else { return }
        present(vc, animated: false, completion: nil)
    }
}

extension HomeViewController {
    func setViewController() {
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "firstHomeViewController") as! firstHomeViewController
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "secondHomeViewController") as! secondHomeViewController
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "thirdHomeViewController") as! thirdHomeViewController
        let vc4 = storyboard?.instantiateViewController(withIdentifier: "firthHomeViewController") as! firthHomeViewController
        let vc5 = storyboard?.instantiateViewController(withIdentifier: "fifthHomeViewController") as! fifthHomeViewController
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        viewControllers.append(vc4)
        viewControllers.append(vc5)
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
        addBar(bar, dataSource: self, at: .custom(view: tabmanView, layout: nil))
    }
    
    func setNavi() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        self.naviItem.titleView = imageView
        leftBarBtn.isSelected = false
        leftBarBtn2.isSelected = false
    }
    
    
}

extension HomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
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
        case 4:
            return viewControllers[4]
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
            return TMBarItem(title: "컬리추천")
        case 1:
            return TMBarItem(title: "신상품")
        case 2:
            return TMBarItem(title: "베스트")
        case 3:
            return TMBarItem(title: "알뜰쇼핑")
        case 4:
            return TMBarItem(title: "특가/혜택")
        default:
            return TMBarItem(title: "")
        }
    }
}

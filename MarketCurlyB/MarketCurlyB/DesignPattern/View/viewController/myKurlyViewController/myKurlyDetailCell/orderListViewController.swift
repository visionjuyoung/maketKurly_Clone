//
//  orderListViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import UIKit
import Tabman
import Pageboy

class orderListViewController: TabmanViewController {

    @IBOutlet weak var tabmanView: UIView!
    
    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = storyboard?.instantiateViewController(withIdentifier: "firstOrderListViewController") as! firstOrderListViewController
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "secondOrderListViewController") as! secondOrderListViewController
                
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        
        setTabManBar()
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

    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: false)
    }
}

extension orderListViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        switch index {
        case 0:
            return viewControllers[0]
        case 1:
            return viewControllers[1]
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
            return TMBarItem(title: "주문 내역")
        case 1:
            return TMBarItem(title: "자주 사는 상품")
        default:
            return TMBarItem(title: "")
        }
    }
    
    
}

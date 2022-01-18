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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension orderListViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        <#code#>
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        <#code#>
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        <#code#>
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        <#code#>
    }
    
    
}

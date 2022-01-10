//
//  detailViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/10.
//

import UIKit
import Tabman
import Pageboy

class detailViewController: TabmanViewController {

    @IBOutlet weak var naviItem: UINavigationItem!
    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var tempView: UIView!
    
    var row: Int = 0
    var section: Int = 0
    
    let categoryListViewModel: CategotyList = CategotyList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        naviBar.topItem?.title = categoryListViewModel.arrayList[section]
    }
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

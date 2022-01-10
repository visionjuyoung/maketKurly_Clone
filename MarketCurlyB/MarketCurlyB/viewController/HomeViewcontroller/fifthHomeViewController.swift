//
//  fifthHomeViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import UIKit

class fifthHomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
        // Do any additional setup after loading the view.
    }
    
    func setInit() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "benefitTableViewCell", bundle: nil), forCellReuseIdentifier: "benefitTableViewCell")
        tableView.separatorStyle = .none
    }
}

extension fifthHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "benefitTableViewCell") as? benefitTableViewCell  else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

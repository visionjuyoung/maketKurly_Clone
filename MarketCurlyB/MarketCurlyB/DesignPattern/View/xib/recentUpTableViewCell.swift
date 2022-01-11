//
//  recentUpTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/11.
//

import UIKit

class recentUpTableViewCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "recentUpSubTableViewCell", bundle: nil), forCellReuseIdentifier: "recentUpSubTableViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension recentUpTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recentUpSubTableViewCell") as? recentUpSubTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

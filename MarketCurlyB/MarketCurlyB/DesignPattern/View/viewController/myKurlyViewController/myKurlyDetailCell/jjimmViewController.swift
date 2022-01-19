//
//  jjimmViewController.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import UIKit

class jjimmViewController: UIViewController {
    
    let heartDataManager = HeartDataManager()
    let state = LoginState.shared
    var arr: [UsersHeartResult] = []
    let productstate = ProductViewState.shared
    
    @IBOutlet weak var numLabel: UILabel!
    var count = 0

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        numLabel.text = "\(count)"
        heartDataManager.LoadHearts(userIdx: state.Idx, delegate: self)
        
    }
    
    func setInit() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "jjimmsTableViewCell", bundle: nil), forCellReuseIdentifier: "jjimmsTableViewCell")
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension jjimmViewController {
    func didSuccessLoadUserHeart(result: [UsersHeartResult]?) {
        guard let lists = result else {
            return
        }
        arr = lists
        tableView.reloadData()
    }
    
    func didsuccess() {
        print("지우기 성공")
    }
}

extension jjimmViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "jjimmsTableViewCell") as? jjimmsTableViewCell else {
            return UITableViewCell()
        }
        cell.productImages.load(urlString: arr[indexPath.row].profileImageUrl)
        cell.productNames.text = arr[indexPath.row].title
        cell.productPrice.text = "\(arr[indexPath.row].price)원"
        cell.productIdx = arr[indexPath.row].productIdx
        cell.button1.addTarget(self, action: #selector(pressDeleteButton(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    @objc func pressDeleteButton(_ button: UIButton) {
        let input = HeartRequest(userIdx: state.Idx, productIdx: productstate.deleteHeartProductNum)
        heartDataManager.DeleteHeart(parameter: input, delegate: self)
        tableView.reloadData()
    }
}

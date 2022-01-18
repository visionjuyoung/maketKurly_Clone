//
//  TotalOrderDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import Foundation
import Alamofire

struct TotalOrderDataManager {
    func loadTotalOrder(userIdx: Int, delegate: firstOrderListViewController) {
        let logIndataManager = LoginState.shared
        
        let url = "https://prod.kaydenserver.shop/api/orders/users/\(userIdx)"
        
        let headers : HTTPHeaders = ["x-access-token" : logIndataManager.jwt]
        
        AF.request(url, method: .get, parameters: nil, headers: headers).responseDecodable(of: TotalOrderResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    //함수
                    delegate.didSuccessLoadTotals(result: response.result)
                    print("")
                case .failure(let error):
                    print(error)
                }
            }
    }
}

//
//  CheckIdDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/13.
//

import Foundation
import Alamofire

class CheckIdDataManager {
    func checkId(data: String, delegate: makeIdViewController) {
        let url = "https://prod.kaydenserver.shop/api/users/check/id/?id=\(data)"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: CheckIdResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    delegate.checkIdSuccess(result: response.result)
                case .failure(let error):
                    print(error)
                    //delegate.checkIdFail()
                }
            }
    }
}

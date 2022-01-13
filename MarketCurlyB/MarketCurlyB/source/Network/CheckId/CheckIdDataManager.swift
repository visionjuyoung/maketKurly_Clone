//
//  CheckIdDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/13.
//

import Foundation
import Alamofire

class CheckIdDataManager {
    func checkId(parameters: String, delegate: makeIdViewController) {
        AF.request("https://prod.kaydenserver.shop/api/users/check/id", method: .get, parameters: nil, headers: nil).validate()
            .responseDecodable(of: CheckIdResponse.self) { response in
                switch response.result {
                case .success(let response):
                    delegate.checkIdSuccess(result: response.message)
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.checkIdFail()
                }
            }
    }
}

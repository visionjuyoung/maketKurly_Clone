//
//  LoadAskDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import Foundation
import Alamofire

class LoadAskDataManager {
    func loadAsk(productIdx: Int, delegate: askViewController) {
        let url = "https://prod.kaydenserver.shop/api/questions/\(productIdx)"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: LoadAskResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    delegate.didSuccessLoadAsk(result: response.result)
                case .failure(let error):
                    print(error)
                    //delegate.checkIdFail()
                }
            }
    }
}

//
//  OrderDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import Foundation
import Alamofire

class OrderDataManager {
    func didOrder(_ parameters: OrderRequest, delegate: orderViewController) {
        let logIndataManager = LoginState.shared
        
        let headers : HTTPHeaders = ["x-access-token" : logIndataManager.jwt]
        
        AF.request("https://prod.kaydenserver.shop/api/orders", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: headers).validate()
            .responseDecodable(of: OrderResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        delegate.didSuccessOrder(result: response.result)
                    } else {
                        switch response.code {
                        case 2000: print("입력값 확인")
                        case 4000: print("데이터베이스 연결 실패")
                        default: print("else...")
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}

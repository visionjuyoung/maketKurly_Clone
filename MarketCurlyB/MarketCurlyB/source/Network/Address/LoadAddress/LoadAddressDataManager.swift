//
//  LoadAddressDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import Foundation
import Alamofire

struct LoadAddressDataManager {
    func loadAddress(userIdx: Int, delegate: cartViewController) {
        let logIndataManager = LoginState.shared
        
        let url = "https://prod.kaydenserver.shop/api/delivery-info/users/\(userIdx)"
        
        let headers : HTTPHeaders = ["x-access-token" : logIndataManager.jwt]
        
        AF.request(url, method: .get, parameters: nil, headers: headers).responseDecodable(of: LoadAddressResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    //함수
                    delegate.didSuccessLoadAddress(result: response.result)
                    print("")
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func loadAddress(userIdx: Int, delegate: deliveryViewController) {
        let logIndataManager = LoginState.shared
        
        let url = "https://prod.kaydenserver.shop/api/delivery-info/users/\(userIdx)"
        
        let headers : HTTPHeaders = ["x-access-token" : logIndataManager.jwt]
        
        AF.request(url, method: .get, parameters: nil, headers: headers).responseDecodable(of: LoadAddressResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    //함수
                    delegate.didsuccessLoadAddress(result: response.result)
                    print("")
                case .failure(let error):
                    print(error)
                }
            }
    }
}

//
//  AddAddressDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import Foundation
import Alamofire

struct AddAddressDataManager {
    
    func AddAddress(_ parameters: AddAddressRequest, delegate: AddDeliveryViewController) {
        let logIndataManager = LoginState.shared

        let url = "https://prod.kaydenserver.shop/api/delivery-info/?isDefaultAdress=F"

        let headers : HTTPHeaders = ["x-access-token" : logIndataManager.jwt]

        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: headers).responseDecodable(of: AddAddressResponse.self) { response in
                switch response.result {
                case .success(let response):
                    //함수
                    delegate.didSuccessAddAddress(result: response.result)
                case .failure(let error):
                    print(error)
                }
            }
    }

}

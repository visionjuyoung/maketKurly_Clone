//
//  AddAddressDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import Foundation
import Alamofire

struct AddAddressDataManager {
//    func AddAddress(_ parameters: AddAddressRequest, delegate: AddDeliveryViewController) {
//        let logIndataManager = LoginState.shared
//
//        let url = "https://prod.kaydenserver.shop/api/delivery-info/?isDefaultAdress=F"
//
//        let headers : HTTPHeaders = ["x-access-token" : logIndataManager.jwt]
//
//        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: headers).responseDecodable(of: AddAddressResponse.self) { response in
//                switch response.result {
//                case .success(let response):
//                    //함수
//                    delegate.didSuccessAddAddress(result: response.result)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
    
    func AddAddress(_ parameters: AddAddressRequest, delegate: AddDeliveryViewController) {
        
        let logIndataManager = LoginState.shared
        let headers : HTTPHeaders = ["x-access-token" : logIndataManager.jwt]
        
        AF.request("https://prod.kaydenserver.shop/api/delivery-info/?isDefaultAdress=F", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: headers).validate(statusCode: 200..<600)
            .responseDecodable(of: AddAddressResponse.self) { response in
                switch response.result {
                case .success(let response):
                    guard let check: Bool = response.isSuccess else { return }
//                    if response.isSuccess {
//                        delegate.didSuccessAddAddress(result: response.result)
//                    } else {
//                        switch response.code {
//                        case 2000: print("입력값 확인")
//                        case 4000: print("데이터베이스 연결 실패")
//                        default: print("else...")
//                        }
//                    }
                    print("\(response.isSuccess) <<< rufrhk")
                case .failure(let error):
                    print(error)
                }
            }
    }
}

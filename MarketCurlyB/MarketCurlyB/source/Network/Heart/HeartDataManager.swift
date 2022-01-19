//
//  HeartDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import Foundation
import Alamofire

class HeartDataManager {
    func didHeart(_ parameters: HeartRequest, delegate: productViewController) {
        let logIndataManager = LoginState.shared
        
        let headers : HTTPHeaders = ["x-access-token" : logIndataManager.jwt]
        
        AF.request("https://prod.kaydenserver.shop/api/likes/?isDefaultAdress=F", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: headers).validate()
            .responseDecodable(of: HeartResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        delegate.didSuccessHeart(result: response.result)
                    } else {
                        switch response.code {
                        case 2000: print("입력값 확인")
                        case 4000: print("데이터베이스 연결 실패")
                        default: delegate.alredy()
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func amoutHeart(userIdx: Int, delegate: myKurlyViewController) {
        let logIndataManager = LoginState.shared
        
        let url = "https://prod.kaydenserver.shop/api/likes/users/\(userIdx)"
        
        let headers : HTTPHeaders = ["x-access-token" : logIndataManager.jwt]
        
        AF.request(url, method: .get, parameters: nil, headers: headers).responseDecodable(of: UsersHeartResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    //함수
                    delegate.didSuccessLoadUserHeart(result: response.result)
                    print("")
                case .failure(let error):
                    print(error)
                }
            }
    }
}

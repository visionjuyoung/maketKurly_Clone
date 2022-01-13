//
//  LogInDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import Foundation
import Alamofire

class LogInDataManager {
    func postLogIn(_ parameters: LoginRequest, delegate: logInViewController) {
        AF.request("https://prod.kaydenserver.shop/api/users/login", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil).validate()
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        delegate.didsuccessLogIn(response.result)
                    } else {
                        switch response.code {
                        case 2000: print("입력값 확인")
                        case 4000: print("데이터베이스 연결 실패")
                        default: print("else...")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToRequest(message: "서버 연결 실패")
                }
            }
    }
}

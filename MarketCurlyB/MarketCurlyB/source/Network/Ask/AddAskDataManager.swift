//
//  AddAskDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import Foundation
import Alamofire

struct AddAskDataManager {
    func AddAsk(_ parameters: AddAskRequest, delegate: makeAskViewController) {
        let logIndataManager = LoginState.shared

        let url = "https://prod.kaydenserver.shop/api/questions"

        let headers : HTTPHeaders = ["x-access-token" : logIndataManager.jwt]

        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: headers).responseDecodable(of: AddAskResponse.self) { response in
                switch response.result {
                case .success(let response):
                    //함수
                    delegate.didSuccessAddAsk(result: response.result)
                case .failure(let error):
                    print(error)
                }
            }
    }
}

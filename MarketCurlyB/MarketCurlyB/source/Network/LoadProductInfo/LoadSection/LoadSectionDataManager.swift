//
//  LoadSectionDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import Foundation
import Alamofire

struct LoadSectionDataManager: Decodable {
    func loadSectionProduct(section: Int, delegate: firstHomeViewController) {
        let url = "https://prod.kaydenserver.shop/api/products/subCategory/\(section)"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: LoadSectionResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    //함수
                    delegate.didSuccessLoadSection(result: response.result)
                    print("")
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func loadSectionProductAll(section: Int, delegate: productListsTableViewCell) {
        let url = "https://prod.kaydenserver.shop/api/products/category/\(section)"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: LoadSectionResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    //함수

                    print("")
                case .failure(let error):
                    print(error)
                }
            }
    }
}

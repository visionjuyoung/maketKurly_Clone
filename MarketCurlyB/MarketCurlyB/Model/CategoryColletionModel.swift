//
//  CategoryColletionModel.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import Foundation

class CategoryCollectionModel {
    let infoList: [CategoryCollectionInfo] = [
        CategoryCollectionInfo(name: "여행·문화"),
        CategoryCollectionInfo(name: "홈캉스"),
        CategoryCollectionInfo(name: "식단관리"),
        CategoryCollectionInfo(name: "간편한 아침식사"),
        CategoryCollectionInfo(name: "재구매 BEST"),
        CategoryCollectionInfo(name: "3천원의 행복"),
        CategoryCollectionInfo(name: "컬리마트"),
        CategoryCollectionInfo(name: "대용량 상품"),
        CategoryCollectionInfo(name: "캠핑"),
        CategoryCollectionInfo(name: "1인 가구"),
        CategoryCollectionInfo(name: "비건"),
        CategoryCollectionInfo(name: "오프라인 맛집"),
        CategoryCollectionInfo(name: "컬리가 만든 상품"),
        CategoryCollectionInfo(name: "Kurly Only"),
        CategoryCollectionInfo(name: "KF 365"),
        CategoryCollectionInfo(name: "1% Table")
    ]
    
    var numberOfCategoryCollectionViewCell: Int {
        return infoList.count
    }
    
    func returnList(at index: Int) -> CategoryCollectionInfo {
        return infoList[index]
    }
}

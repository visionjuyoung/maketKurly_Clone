//
//  LogInPageCellTitleInfo.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/15.
//

import Foundation

struct LogInPageCellTitleInfo {
    let login: LogIned = LogIned()
    let logout: LogOuted = LogOuted()
}

struct LogOuted {
    let logOutSection1: [String] = ["비회원 주문 조회", "알림 설정"]
    let logOutSection2: [String] = ["컬리소개", "배송 안내", "공지사항", "자주하는 질문", "고객센터", "이용안내"]
}

struct LogIned {
    let logInSection1 : [String] = ["적립금" , "쿠폰", "친구초대"]
    let logInSection2: [String] = ["주문 내역", "선물 내역", "찜한 상품", "상품 후기"]
    let logInSection3: [String] = ["배송지 관리", "컬리 퍼플 박스", "개인정보 수정", "알림 설정"]
    let logInSection4: [String] = ["상품 문의", "1:1 문의", "대량주문 문의"]
    let logInSection5: [String] = ["컬리소개", "컬리패스", "배송 안내", "공지사항", "자주하는 질문", "고객센터", "이용안내"]
    let logInSection6: [String] = ["로그아웃"]
}

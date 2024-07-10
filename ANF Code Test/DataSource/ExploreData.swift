//
//  ExplortData.swift
//  ANF Code Test
//
//  Created by Leng Trang on 7/9/24.
//

import Foundation

struct ExploreData: Decodable {
    let title: String?
    let backgroundImage: String?
    let content: [Content]?
    let promoMessage: String?
    let topDescription: String?
    let bottomDescription: String?
}

struct Content: Decodable {
    let target: String?
    let title: String?
}


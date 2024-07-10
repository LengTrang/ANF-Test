//
//  ExporeDataManager.swift
//  ANF Code Test
//
//  Created by Leng Trang on 7/9/24.
//

import Foundation

protocol ExploreDataProtocol: AnyObject {
    func receiveData(data: [ExploreData]?)
}

class ExploreDataManager {
    
    private var dataSource: [ExploreData]?
    
    weak var delegate: ExploreDataProtocol?
    
    func loadData() {
        if let filePath = Bundle.main.path(forResource: "exploreData", ofType: "json"),
           let fileContent = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
           let jsonDictionary = try? JSONDecoder().decode([ExploreData].self, from: fileContent) {
            
            delegate?.receiveData(data: jsonDictionary)
        }
    }
}




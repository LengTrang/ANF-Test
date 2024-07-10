//
//  ContentPageViewModel.swift
//  ANF Code Test
//
//  Created by Leng Trang on 7/10/24.
//

import Foundation
import UIKit

class ContentPageViewModel {
    
    let contentData: [Content]
    
    init(contentData: [Content]) {
        self.contentData = contentData
    }
    
    func recieveContentCount() -> Int {
        if contentData.count > 0 {
            return contentData.count
        } else {
            return 0
        }
    }
    
    func createCellAtIndex(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "content", for: indexPath) as? ContentCell else { return UITableViewCell() }
        cell.button.text = contentData[indexPath.row].title ?? ""
        return cell
    }
}

//
//  MainPageViewModel.swift
//  ANF Code Test
//
//  Created by Leng Trang on 7/9/24.
//

import Foundation
import UIKit
import SafariServices

class MainPageViewModel {
    var dataExplore: [ExploreData]?
    var viewController: UIViewController?
    
    private var exploreManager: ExploreDataManager?
    
    init() {
        exploreManager = ExploreDataManager()
        exploreManager?.delegate = self
        exploreManager?.loadData()
    }
    
    func recieveContentCount() -> Int {
        return dataExplore?.count ?? 0
    }
    
    func recieveRowHight(indexPath: IndexPath) -> CGFloat {
        return dataExplore?[indexPath.row].content != nil ? 500 : 450 
    }
    
    func createCellAtIndex(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreContentCell", for: indexPath) as? MainCell else { return UITableViewCell() }
        cell.delegate = self
        
        cell.title1.text = dataExplore?[indexPath.row].topDescription ?? ""
        cell.title2.text = dataExplore?[indexPath.row].title ?? ""
        cell.title3.text = dataExplore?[indexPath.row].promoMessage ?? ""
        cell.title4.text = dataExplore?[indexPath.row].bottomDescription ?? ""
        
        if let name = dataExplore?[indexPath.row].backgroundImage as? String, let image = UIImage(named: name) {
            cell.backgroundImage.image = image
        }
        
        if let content = dataExplore?[indexPath.row].content {
            cell.contentData = content
            cell.setDataSource()
        }
        
        return cell
    }
}


extension MainPageViewModel: ExploreDataProtocol {
    func receiveData(data: [ExploreData]?) {
        dataExplore = data
    }
}

extension MainPageViewModel: ContentProtocol {
    func didSelectContent(content: Content) {
        if let url = URL(string:content.target ?? "") {
            let viewcontroller = SFSafariViewController(url: url)
            viewController?.present(viewcontroller, animated: true)
        }
    }
}

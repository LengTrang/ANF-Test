//
//  ANFExploreCardTableViewController.swift
//  ANF Code Test
//

import UIKit

class ANFExploreCardTableViewController: UITableViewController {
    
    var dataExplore: [ExploreData]?
    var exploreManager: ExploreDataManager?
    
    override func viewDidLoad() {
        exploreManager = ExploreDataManager()
        exploreManager?.delegate = self
        exploreManager?.loadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataExplore?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ExploreContentCell", for: indexPath)
        if let titleLabel = cell.viewWithTag(1) as? UILabel,
           let titleText = dataExplore?[indexPath.row].title as? String {
            titleLabel.text = titleText
        }
        
        if let imageView = cell.viewWithTag(2) as? UIImageView,
           let name = dataExplore?[indexPath.row].backgroundImage as? String,
           let image = UIImage(named: name) {
            imageView.image = image
        }
        
        return cell
    }
}

extension ANFExploreCardTableViewController: ExploreDataProtocol {
    func receiveData(data: [ExploreData]?) {
        dataExplore = data
    }
}

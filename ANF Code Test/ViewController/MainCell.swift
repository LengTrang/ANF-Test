//
//  MainCellTableViewCell.swift
//  ANF Code Test
//
//  Created by Leng Trang on 7/9/24.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var title3: UILabel!
    @IBOutlet weak var title4: UITextView!

    @IBOutlet weak var tableView: UITableView!
    
    var contentData: [Content]?
    var viewModel: ContentPageViewModel?
    
    weak var delegate: ContentProtocol?
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDataSource() {
        guard let contentData else { return }
        viewModel = ContentPageViewModel(contentData: contentData)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MainCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.recieveContentCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel?.createCellAtIndex(tableView: tableView, indexPath: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let contentData{
            delegate?.didSelectContent(content: contentData[indexPath.row])
        }
    }
}

protocol ContentProtocol: AnyObject {
    func didSelectContent(content: Content)
}

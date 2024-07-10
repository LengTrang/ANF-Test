//
//  ContentCell.swift
//  ANF Code Test
//
//  Created by Leng Trang on 7/9/24.
//

import UIKit

class ContentCell: UITableViewCell {

    @IBOutlet weak var button: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

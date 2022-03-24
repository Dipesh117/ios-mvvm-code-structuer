//
//  HomeViewNewsTableViewCell.swift
//  News MVVM Demo
//
//  Created by iMac on 31/07/21.
//

import UIKit

class HomeViewNewsTableViewCell: UITableViewCell {
// MARK:- Outlets
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

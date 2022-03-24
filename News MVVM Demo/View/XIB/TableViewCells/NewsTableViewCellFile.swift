//
//  NewsViewModelDataSource.swift
//  News MVVM Demo
//
//  Created by iMac on 31/07/21.
//

import UIKit
import SDWebImage

class NewsTableViewCellFile: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var authorTitle: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    // MARK: - Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Setup Data
    func setupData(authorTitleText: String,titleLabelTest:String,imageUrlString: String) {
        self.newsImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.newsImage.sd_setImage(with: URL(string: imageUrlString), placeholderImage: UIImage(named: "placeholder.png"))

        self.authorTitle.text = authorTitleText
        self.titleLabel.text = titleLabelTest
    }
    
}

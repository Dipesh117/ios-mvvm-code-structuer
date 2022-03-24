//
//  DetailsNewsViewController.swift
//  News MVVM Demo
//
//  Created by iMac on 31/07/21.
//

import UIKit
import SDWebImage

class DetailsNewsViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var titleHeaderLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAuthorName: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsDeclarationLabel: UILabel!
    @IBOutlet weak var newsContentlabel: UILabel!
    
    
    // MARK: - Declaration
    var articls :Articles?
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupData()
    }
    
    static func create(_ articls: Articles)-> DetailsNewsViewController {
        let controller = AppStoryboard.Home.instance.instantiateViewController(withIdentifier: "DetailsNewsViewController") as! DetailsNewsViewController
        controller.articls = articls
        return controller
    }
    
    // MARK: - Setup View
    func setupView()  {
        self.newsImageView.layer.borderWidth = 1
        self.newsImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    // MARK: - Button Action
    @IBAction func BackButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func NetworkButtonAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "\(articls?.url ?? "")")!)
    }
    
    
    // MARK: - Other Function
    func setupData() {
        self.titleHeaderLabel.text = TextString().detailTitle
        self.publishDateLabel.text = articls?.publishedAt
        self.newsTitleLabel.text = articls?.title
        self.newsAuthorName.text = articls?.author
        self.newsImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.newsImageView.sd_setImage(with: URL(string: articls?.urlToImage ?? ""), placeholderImage: nil)
        self.newsDeclarationLabel.text = articls?.descriptionValue
        self.newsContentlabel.text = articls?.content
    }
}

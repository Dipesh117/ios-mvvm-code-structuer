//
//  NewsHomeViewController.swift
//  News MVVM Demo
//
//  Created by iMac on 31/07/21.
//

import UIKit

class NewsHomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsTableView: UITableView!

    // MARK: - Declaration
    var viewModel : NewsViewModel?
    private var dataSource: NewsViewModelDataSource!

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.bindViewModel()
        self.viewModel?.getNewsAllData()

    }
    
    
    // MARK: - Setup View
    func setupView() {
        self.newsTitleLabel.text =  TextString().homeViewTitleString
        self.newsTableView.register(UINib(nibName: "NewsTableViewCellFile", bundle: nil), forCellReuseIdentifier: "NewsTableViewCellFile")

    }
    
    /// Bind ViewModel
    func bindViewModel() {
        self.viewModel = NewsViewModel()
        self.viewModel?.success = { () in
            
        }
        
        self.viewModel?.failure = {
            (error) in
        }
        self.viewModel?.data = {
            (data) in
            self.updateDataSource(item: data)
        }
        
       
    }
    
    func updateDataSource(item: NewsModelClass) {
        self.dataSource = NewsViewModelDataSource(identifier: "NewsTableViewCellFile", item: item)
        DispatchQueue.main.async {
            self.newsTableView.delegate = self.dataSource
            self.newsTableView.dataSource = self.dataSource
            self.newsTableView.reloadData()
        }
        
        self.dataSource.selectedNews = {
            (data) in
            let controller = DetailsNewsViewController.create(data)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
  
}

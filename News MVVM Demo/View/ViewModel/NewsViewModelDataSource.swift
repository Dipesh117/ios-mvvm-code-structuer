//
//  NewsViewModelDataSource.swift
//  News MVVM Demo
//
//  Created by iMac on 31/07/21.
//

import UIKit
import Foundation

class NewsViewModelDataSource: NSObject,UITableViewDataSource,UITableViewDelegate {
    
    private var identifier : String!
    private var item : NewsModelClass?
    
    var selectedNews:((_ item: Articles)-> Void)?

    
    init(identifier:String,item: NewsModelClass) {
        self.identifier = identifier
        self.item = item
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! NewsTableViewCellFile
        
        cell.setupData(authorTitleText: "\(item?.articles?[indexPath.row].author ?? "-")", titleLabelTest: "\(item?.articles?[indexPath.row].title ?? "-")", imageUrlString: "\(item?.articles?[indexPath.row].urlToImage ?? "")")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedNews?((self.item?.articles?[indexPath.row])!)
    }
}

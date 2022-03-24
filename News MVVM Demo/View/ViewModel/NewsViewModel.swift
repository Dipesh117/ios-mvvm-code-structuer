//
//  NewsViewModel.swift
//  News MVVM Demo
//
//  Created by iMac on 31/07/21.
//

import UIKit

class NewsViewModel: NSObject {
    
    
    // MARK: - Init
    override init() {
        super .init()
        
    }
    
    // MARK: - Network completion
    var success:(() -> Void)?
    var data :((_ empData: NewsModelClass) -> Void)?
    var failure : ((_ error:Error?) ->  Void)?
    var progress : ((_ isAppear : Bool) -> Void)?
    
    var newsList : NewsModelClass?
    
    // MARK: - Network Request
    func getNewsAllData() {
        
        
        APIService.modelApiGetMethod(url: Urls.newsApi, parameters: [:], header: [:]) { (Responce) in
            self.success?()
            do{
                let decoder = JSONDecoder()
                self.newsList = try decoder.decode(NewsModelClass.self, from: Responce)
                self.data?(self.newsList!)
            }
            catch let error{
                self.failure?(error)
            }
            
            
        } failed: { (error) in
            self.failure?(error)
        }
        
    }
    
    
    
}

//
//  NewsServices.swift
//  News MVVM Demo
//
//  Created by iMac on 31/07/21.
//

import Foundation
import UIKit
import Alamofire



class APIService {
    
    
    // MARK: - News Data Get Api Service
    static func modelApiGetMethod(url:String,parameters:[String:Any] ,header:[String:String] , success: @escaping (  _ parsedJSON: Data) -> Void, failed: @escaping (  _ errorMsg: Error) -> Void){
        
        AF.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(_ ):
                success(response.data!)
                break
            case .failure(let error):
                failed(error)
                break
            }
            
        }
        
    }
    
    
    // MARK: - Login Api Service
    static func loginApi(url:String,parameters:[String:Any] , success: @escaping (  _ parsedJSON: Data) -> Void, failed: @escaping (  _ errorMsg: Error) -> Void){
        let headers : HTTPHeaders = [
            "key" : "sandip"
        ]

        AF.request(url, method: .post, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(_ ):
                success(response.data!)
                break
            case .failure(let error):
                failed(error)
                break
            }
            
        }
        
    }
    
}

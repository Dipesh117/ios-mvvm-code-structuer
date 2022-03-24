//
//  AppContant.swift
//  News MVVM Demo
//
//  Created by iMac on 31/07/21.
//

import Foundation
import UIKit

// MARK: - APP INFORMATIONS
let rootWindow = UIApplication.shared.windows.first!

var systemVersion : String {
    get {
        return UIDevice.current.systemVersion
    }
}


// MARK: - SCREEN-SIZES
let SCREEN = UIScreen.main.bounds
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let iphone4 = UIScreen.main.bounds.size.height == 480
let iphone5 = UIScreen.main.bounds.size.height == 568
let iphone6i7 = UIScreen.main.bounds.size.height == 667
let iphone6i7plus = UIScreen.main.bounds.size.height == 736
let iphoneX = UIScreen.main.bounds.size.height == 812


// MARK: - APP-STORYBOARD CONSTANTS
enum AppStoryboard : String {
    case Home = "Home"

    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

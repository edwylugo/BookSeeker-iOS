//
//  CommonToUI.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation
import UIKit

class CommonToUI {
    var alertController: UIAlertController!
    var navigationController: UINavigationController!
    var view: UIView!
    
    // MARK: Shared Instance
    static let sharedInstance: CommonToUI = {
        let instance = CommonToUI()
        return instance
    }()
    
    private init() {}
    
    
    
}

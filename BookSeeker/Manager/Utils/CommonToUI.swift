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
     
    let keyWindow = UIApplication.shared.connectedScenes
           .filter { $0.activationState == .foregroundActive }
           .map { $0 as? UIWindowScene }
           .compactMap { $0 }
           .first?.windows
           .filter { $0.isKeyWindow }.first
    
    // MARK: Shared Instance
    static let sharedInstance: CommonToUI = {
        let instance = CommonToUI()
        return instance
    }()
    
    private init() {}
    
    func presentFromController(_ controller: UIViewController, _ alert: UIAlertController, animated: Bool, completion: (() -> Void)?) {
        if let navVC = controller as? UINavigationController,
            let visibleVC = navVC.visibleViewController {
            presentFromController(visibleVC, alert, animated: animated, completion: completion)
        } else {
            if let tabVC = controller as? UITabBarController,
                let selectedVC = tabVC.selectedViewController {
                presentFromController(selectedVC, alert, animated: animated, completion: completion)
            } else {
                if let currentAlert = controller.presentedViewController as? UIAlertController {
                    currentAlert.dismiss(animated: true) {
                        controller.present(alert, animated: animated, completion: completion)
                    }
                } else {
                    controller.present(alert, animated: animated, completion: completion)
                }
            }
        }
    }

    func show() {
        if let rootVC = keyWindow!.rootViewController {
            presentFromController(rootVC, self.alertController, animated: true, completion: nil)
        }
    }
    
    func showAlert(_ title: String, _ msg: String, _ callBack: (() -> Void)?, _ controller: UIViewController? = nil) {
        self.hideAlertTostMessage()

        print("\(msg) ====== ")

        self.alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)

        self.alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            if callBack != nil {
                callBack!()
            }
        }))

        if controller != nil {
            controller!.present(self.alertController, animated: true, completion: nil)
        } else {
            self.show()
        }
    }
    
    func hideAlertTostMessage() {
        print("hideAlertTostMessage ====== ")
        if self.alertController != nil {
            self.alertController.dismiss(animated: true, completion: nil)
        }
    }
}

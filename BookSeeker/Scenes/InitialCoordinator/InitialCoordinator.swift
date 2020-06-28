//
//  InitialCoordinator.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation
import UIKit

final class InitialCoordinator: Coordinator {
    
var childCoordinators: [Coordinator] = []
   private let presenter: UINavigationController

   init(presenter: UINavigationController) {
       self.presenter = presenter
   }

   func start() {
       let viewController = TabBarAppViewController()
       presenter.pushViewController(viewController, animated: true)
   }
}

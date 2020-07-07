//
//  NavigationController.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    override func loadView() {
        super.loadView()
        configureNavigation()
    }

    private func configureNavigation() {
        navigationBar.tintColor = .white
        navigationBar.prefersLargeTitles = true
        navigationBar.barStyle = .black
        navigationBar.isTranslucent = true
    }
}

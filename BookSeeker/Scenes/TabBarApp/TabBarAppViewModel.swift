//
//  TabBarAppViewModel.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

protocol TabBarAppNavigationProtocol: AnyObject {}

protocol TabBarAppViewModelProtocol {}

struct TabBarAppViewModel {
    private var navigationDelegate: TabBarAppNavigationProtocol

    init(navigationDelegate: TabBarAppNavigationProtocol) {
        self.navigationDelegate = navigationDelegate
    }
}

//
//  BookStoreViewModel.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

protocol BookStoreNavigationProtocol: AnyObject {}

protocol BookStoreViewModelProtocol {}

struct BookStoreViewModel: BookStoreViewModelProtocol {
    private weak var navigationDelegate: BookStoreNavigationProtocol?
    init(navigationDelegate: BookStoreNavigationProtocol? = nil) {
        self.navigationDelegate = navigationDelegate
    }
}

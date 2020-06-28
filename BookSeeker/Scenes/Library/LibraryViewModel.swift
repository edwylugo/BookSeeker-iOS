//
//  LibraryViewModel.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

protocol LibraryNavigationProtocol: AnyObject {}

protocol LibraryViewModelProtocol {}

struct LibraryViewModel: LibraryViewModelProtocol {
    private weak var navigationDelegate: LibraryNavigationProtocol?
    init(navigationDelegate: LibraryNavigationProtocol? = nil) {
        self.navigationDelegate = navigationDelegate
    }
}

//
//  SeachViewModel.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//


import Foundation

protocol SearchNavigationProtocol: AnyObject {}

protocol SearchViewModelProtocol {}

struct SearchViewModel: SearchViewModelProtocol {
    private weak var navigationDelegate: SearchNavigationProtocol?

    init(navigationDelegate: SearchNavigationProtocol?) {
        self.navigationDelegate = navigationDelegate
    }
}

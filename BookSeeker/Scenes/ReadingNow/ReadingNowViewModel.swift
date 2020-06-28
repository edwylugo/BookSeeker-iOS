//
//  ReadingNowViewModel.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

protocol ReadingNowNavigationProtocol: AnyObject {}

protocol ReadingNowViewModelProtocol {}

struct ReadingNowViewModel: ReadingNowViewModelProtocol {
    private weak var navigationDelegate: ReadingNowNavigationProtocol?

    init(navigationDelegate: ReadingNowNavigationProtocol? = nil) {
        self.navigationDelegate = navigationDelegate
    }
}


//
//  BookDetailViewModel.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

protocol BookDetailNavigationProtocol: AnyObject {}

protocol BookDetailViewModelProtocol {
    var books: Book { get }
}

struct BookDetailViewModel: BookDetailViewModelProtocol {
    var books: Book
    private weak var navigationDelegate: BookDetailNavigationProtocol?
    
    init(navigationDelegate: BookDetailNavigationProtocol? = nil, books: Book) {
           self.navigationDelegate = navigationDelegate
           self.books = books
       }
    
}

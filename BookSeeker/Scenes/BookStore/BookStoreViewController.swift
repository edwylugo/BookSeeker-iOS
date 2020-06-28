//
//  BookStoreViewController.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

class BookStoreViewController: UIViewController {
    private var viewModel: BookStoreViewModelProtocol

    init(viewModel: BookStoreViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "BookStoreViewController", bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Book Store"

    }
}

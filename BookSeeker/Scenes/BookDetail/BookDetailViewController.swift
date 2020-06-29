//
//  BookDetailViewController.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    private var viewModel: BookDetailViewModelProtocol

    init(viewModel: BookDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "BookDetailViewController", bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

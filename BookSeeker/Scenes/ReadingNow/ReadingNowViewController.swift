//
//  ReadingNowViewController.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

class ReadingNowViewController: UIViewController {
    private var viewModel: ReadingNowViewModelProtocol

    init(viewModel: ReadingNowViewModelProtocol) {
           self.viewModel = viewModel
           super.init(nibName: "ReadingNowViewController", bundle: nil)
    }

    required init?(coder _: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Reading Now"
    }
    
    
   
}

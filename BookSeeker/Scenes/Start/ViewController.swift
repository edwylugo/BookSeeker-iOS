//
//  ViewController.swift
//  BookSeeker
//
//  Created by Teobaldo Mauro de Moura on 26/09/19.
//  Copyright © 2019 CIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func goTabBarApp(_ sender: Any) {
        let coordinator = InitialCoordinator(presenter: self.navigationController!)
        coordinator.start()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

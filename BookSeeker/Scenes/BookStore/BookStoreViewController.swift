//
//  BookStoreViewController.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit
import Lottie

class BookStoreViewController: UIViewController {
    private var viewModel: BookStoreViewModelProtocol

    init(viewModel: BookStoreViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "BookStoreViewController", bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet var containerView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Book Store"
        
        
        // Create Animation object
        let jsonName = "18123-developer"
        let animation = Animation.named(jsonName)

        // Load animation to AnimationView
        let animationView = AnimationView(animation: animation)
        // animationView.frame = CGRect(x: 0, y: 0, width: 327, height: 179)
        // animationView.frame = self.containerView.frame
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit

        // Add animationView as subview
        self.containerView.addSubview(animationView)

        animationView.translatesAutoresizingMaskIntoConstraints = false

        // Apply these constrains if you want animation size should be same as super view.
        self.containerView.addConstraint(NSLayoutConstraint(item: animationView, attribute: .leading, relatedBy: .equal, toItem: self.containerView, attribute: .leading, multiplier: 1.0, constant: 1))
        self.containerView.addConstraint(NSLayoutConstraint(item: animationView, attribute: .trailing, relatedBy: .equal, toItem: self.containerView, attribute: .trailing, multiplier: 1.0, constant: 1))
        self.containerView.addConstraint(NSLayoutConstraint(item: animationView, attribute: .top, relatedBy: .equal, toItem: self.containerView, attribute: .top, multiplier: 1.0, constant: 1))
        self.containerView.addConstraint(NSLayoutConstraint(item: animationView, attribute: .bottom, relatedBy: .equal, toItem: self.containerView, attribute: .bottom, multiplier: 1.0, constant: 1))

        // Play the animation
        animationView.play()

    }
}

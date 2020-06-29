//
//  TabBarAppViewController.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

class TabBarAppViewController: UITabBarController, UITabBarControllerDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        title = "Reading Now"

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Custom Tab bar
        self.tabBar.barTintColor = UIColor(named: "gray")
        UITabBar.appearance().tintColor = UIColor(named: "black")
        UITabBar.appearance().barTintColor = UIColor(named: "gray")
        UITabBar.appearance().unselectedItemTintColor = .lightGray
        UITabBar.appearance().isTranslucent = true

        let viewModelReadingNow = ReadingNowViewModel(navigationDelegate: self)
        let tabOne = ReadingNowViewController(viewModel: viewModelReadingNow)
        let tabOneBarItem = UITabBarItem(title: "Reading Now", image: UIImage(systemName: "book.fill"), selectedImage: UIImage(systemName: "book.fill"))
        tabOne.tabBarItem = tabOneBarItem

        let viewModelLibrary = LibraryViewModel(navigationDelegate: self)
        let tabTwo = LibraryViewController(viewModel: viewModelLibrary)
        let tabTwoBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "heart.fill"), selectedImage: UIImage(systemName: "heart.fill"))
        tabTwo.tabBarItem = tabTwoBarItem

        let viewModelBookStore = BookStoreViewModel(navigationDelegate: self)
        let tabThree = BookStoreViewController(viewModel: viewModelBookStore)
        let tabThreeBarItem = UITabBarItem(title: "Book Store", image: UIImage(systemName: "bag.fill"), selectedImage: UIImage(systemName: "bag.fill"))
        tabThree.tabBarItem = tabThreeBarItem

        let viewModelSearch = SearchViewModel(navigationDelegate: self)
        let tabFour = SearchViewController(viewModel: viewModelSearch)
        let tabFourBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        tabFour.tabBarItem = tabFourBarItem
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
    }
    func tabBarController(_: UITabBarController, didSelect viewController: UIViewController) {
        if viewController.isKind(of: ReadingNowViewController.self) {
             self.navigationItem.title = "Reading Now"
        } else if viewController.isKind(of: LibraryViewController.self) {
             self.navigationItem.title = "Library"
        } else if viewController.isKind(of: BookStoreViewController.self) {
            self.navigationItem.title = "Book Store"
        } else {
            self.navigationItem.title = "Search"
        }
    }
}

extension TabBarAppViewController: ReadingNowNavigationProtocol { }
extension TabBarAppViewController: LibraryNavigationProtocol { }
extension TabBarAppViewController: BookStoreNavigationProtocol { }
extension TabBarAppViewController: SearchNavigationProtocol { }

//
//  TabBarAppViewController.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

class TabBarAppViewController: UITabBarController, UITabBarControllerDelegate  {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setTitles(navigationTitle: "Search", tabBarTitle: "Em Processo")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Custom Tab bar
        self.tabBar.barTintColor = UIColor(named: "black")
        UITabBar.appearance().tintColor = UIColor(named: "white")
        UITabBar.appearance().barTintColor = UIColor(named: "black")
        UITabBar.appearance().unselectedItemTintColor = .lightGray
        UITabBar.appearance().isTranslucent = true

        //let viewModelListNotes = ListNotesViewModel(navigationDelegate: self)
        let tabOne = SearchViewController()
        let tabOneBarItem1 = UITabBarItem(title: "Search", image: UIImage(systemName: "lock.open"), selectedImage: UIImage(systemName: "lock.open.fill"))
        tabOne.tabBarItem = tabOneBarItem1

//        let viewModelListNotesOnline = NotesOnlineViewModel(navigationDelegate: self)
//        let tabTwo = NotesOnlineViewController(viewModel: viewModelListNotesOnline)
//        let tabTwoBarItem2 = UITabBarItem(title: "Encerradas", image: UIImage(systemName: "lock"), selectedImage: UIImage(systemName: "lock.fill"))
//        tabTwo.tabBarItem = tabTwoBarItem2

        self.viewControllers = [tabOne]
    }
    func navigationController(navigationController _: UINavigationController, willShowViewController viewController: UIViewController, animated _: Bool) {
        if viewController.isKind(of: SearchViewController.self) {
            self.navigationController?.tabBarItem.title = "Search"
        }
    }
    func setTitles(navigationTitle: String, tabBarTitle: String) {
           self.title = tabBarTitle
           self.navigationItem.title = navigationTitle
       }

}

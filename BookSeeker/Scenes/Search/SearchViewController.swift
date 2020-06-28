//
//  SearchViewController.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    private var viewModel: SearchViewModelProtocol

    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "SearchViewController", bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet var sbPesquisa: UISearchBar! {
        didSet {
            //sbPesquisa.delegate = self
            sbPesquisa.searchTextField.textColor = UIColor(named: "black")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.setHidesBackButton(false, animated: true)
        self.title = "Search"
        setupUI()
    }
    
    func setupUI() {
        sbPesquisa.placeholder = "Search Apple Books..."
        sbPesquisa.searchTextField.borderStyle = .none
        sbPesquisa.searchTextField.backgroundColor = UIColor(named: "gray")
        sbPesquisa.searchTextField.layer.cornerRadius = 10
        sbPesquisa.searchTextField.clipsToBounds = true
        sbPesquisa.searchBarStyle = .minimal
        addToolBar(sbPesquisa.searchTextField)
    }
    
    func addToolBar(_ textField: UITextField) {
           // ToolBar
        let toolBar = UIToolbar(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: self.view.bounds.width, height: CGFloat(44))))
           toolBar.barStyle = .default
           toolBar.isTranslucent = true
           toolBar.tintColor = UIColor(red: 92 / 255, green: 216 / 255, blue: 255 / 255, alpha: 1)
           toolBar.sizeToFit()

           let title = ""

           // Adding Button ToolBar in UIPickerView
           let doneButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(SearchViewController.doneClick))
           doneButton.tintColor = UIColor(named: "black")
           let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
           let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(SearchViewController.cancelClick))
           cancelButton.tintColor = UIColor(named: "black")

           let labelSelecione = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil) // 7
           labelSelecione.tintColor = UIColor.white

           toolBar.setItems([cancelButton, spaceButton, labelSelecione, spaceButton, doneButton], animated: false)
           toolBar.isUserInteractionEnabled = true
           textField.inputAccessoryView = toolBar
       }
    
      @objc func doneClick() {
           self.view.endEditing(true)
       }

       @objc func cancelClick() {
          self.view.endEditing(true)
       }
}

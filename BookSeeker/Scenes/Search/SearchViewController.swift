//
//  SearchViewController.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit
import SafariServices

class SearchViewController: UIViewController, SFSafariViewControllerDelegate {
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
            sbPesquisa.delegate = self
            sbPesquisa.searchTextField.textColor = UIColor(named: "black")
        }
    }
    
    @IBOutlet var tableView: UITableView!  {
           didSet {
               tableView.delegate = self
               tableView.dataSource = self
           }
       }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.setHidesBackButton(false, animated: true)
        self.title = "Search"
        setupUI()
        setupBindings()
    }
    
    func setupUI() {
        sbPesquisa.placeholder = "Search Apple Books..."
        sbPesquisa.searchTextField.borderStyle = .none
        sbPesquisa.searchTextField.backgroundColor = UIColor(named: "gray")
        sbPesquisa.searchTextField.layer.cornerRadius = 10
        sbPesquisa.searchTextField.clipsToBounds = true
        sbPesquisa.searchBarStyle = .minimal
        addToolBar(sbPesquisa.searchTextField)
        
        // Retorna a célula da interface
        let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
    }
    
    func setupBindings() {
           viewModel.dataSource.bind { [weak self] _ in
               guard let self = self else { return }
               DispatchQueue.main.async {
                   self.tableView.reloadData()
               }
           }
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

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return viewModel.dataSource.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        
        return cell
    }

    func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? SearchTableViewCell else { return }
        guard viewModel.dataSource.value.indices.contains(indexPath.row) else { return }
        let book = viewModel.dataSource.value[indexPath.row]
        cell.setup(viewModel: book)
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        guard viewModel.dataSource.value.indices.contains(indexPath.row) else { return }
        let book = viewModel.dataSource.value[indexPath.row]
        
        let svc = SFSafariViewController(url: NSURL(string: "\(book.trackViewUrl)")! as URL)
        self.present(svc, animated: true, completion: nil)
        svc.delegate = self
        
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
           controller.dismiss(animated: true, completion: nil)
       }
}

extension SearchViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_: UIScrollView) {
        view.endEditing(true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.filterBooks(search: searchBar.text)
        tableView.reloadData()
        view.endEditing(true)
    }

    func searchBarCancelButtonClicked(_: UISearchBar) {
        viewModel.filterBooks(search: nil)
        tableView.reloadData()
        view.endEditing(true)
    }

    func searchBar(_: UISearchBar, textDidChange searchText: String) {
        viewModel.filterBooks(search: searchText)
        tableView.reloadData()
    }
}

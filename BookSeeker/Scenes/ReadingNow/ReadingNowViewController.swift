//
//  ReadingNowViewController.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit
import SafariServices

class ReadingNowViewController: UIViewController , SFSafariViewControllerDelegate {
    private var viewModel: ReadingNowViewModelProtocol
    
    init(viewModel: ReadingNowViewModelProtocol) {
           self.viewModel = viewModel
           super.init(nibName: "ReadingNowViewController", bundle: nil)
    }

    required init?(coder _: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet var tableViewReadingNow: UITableView! {
        didSet {
            tableViewReadingNow.delegate = self
            tableViewReadingNow.dataSource = self
        }
    }
    
    var bookSelected: String = ""
    var books: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Reading Now"
        setupUI()
        setupBindings()
    }
    
    func setupUI() {
        // Retorna a célula da interface
        let nib = UINib(nibName: "ReadingNowTableViewCell", bundle: nil)
        tableViewReadingNow.register(nib, forCellReuseIdentifier: ReadingNowTableViewCell.reuseIdentifier)
    }
    
    
    func setupBindings() {
           viewModel.dataSource.bind { [weak self] _ in
               guard let self = self else { return }
               DispatchQueue.main.async {
                   self.tableViewReadingNow.reloadData()
               }
           }
    }
}

extension ReadingNowViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return viewModel.dataSource.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReadingNowTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? ReadingNowTableViewCell else { return UITableViewCell() }
        
        
        if cell.addFavorite.isSelected {
          let book = viewModel.dataSource.value[indexPath.row]
          cell.item = book.name
          cell.imagem = book.cover
          cell.urlSave = book.trackViewUrl
        }
        
        return cell
    }

    func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ReadingNowTableViewCell else { return }
        guard viewModel.dataSource.value.indices.contains(indexPath.row) else { return }
        let book = viewModel.dataSource.value[indexPath.row]
        cell.setup(viewModel: book, indexPath: indexPath.row)
        
        
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

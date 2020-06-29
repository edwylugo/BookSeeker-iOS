//
//  LibraryViewController.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit
import SafariServices
import Kingfisher

class LibraryViewController: UIViewController, SFSafariViewControllerDelegate {
    
    private var viewModel: LibraryViewModelProtocol

    init(viewModel: LibraryViewModelProtocol) {
           self.viewModel = viewModel
           super.init(nibName: "LibraryViewController", bundle: nil)
    }

    required init?(coder _: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    var books: [String] = []
    var imagens: [String] = []
    var urls: [String] = []
    @IBOutlet var btFavorite: UIButton!
    @IBOutlet var lbMessage: UILabel!
    
    @IBOutlet var tableViewLibrary: UITableView! {
        didSet {
            tableViewLibrary.delegate = self
            tableViewLibrary.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Library"
        setupUI()
        setupBindings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
           atualizarListaTarefas()
       }
    
    
    func setupUI() {
           // Retorna a célula da interface
           let nib = UINib(nibName: "ReadingNowTableViewCell", bundle: nil)
           tableViewLibrary.register(nib, forCellReuseIdentifier: ReadingNowTableViewCell.reuseIdentifier)
       }
       
       
       func setupBindings() {
              viewModel.dataSource.bind { [weak self] _ in
                  guard let self = self else { return }
                  DispatchQueue.main.async {
                      self.tableViewLibrary.reloadData()
                  }
              }
       }
    
    func atualizarListaTarefas() {
           let book = LibraryUserDefaults()
           books = book.listar()
           imagens = book.listarImagens()
           urls = book.listarUrls()
           tableViewLibrary.reloadData()
       }
    
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        
        if books.count > 0 {
            btFavorite.isHidden = true
            lbMessage.isHidden = true
        } else {
            btFavorite.isHidden = false
            lbMessage.isHidden = false
        }
        
        return books.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            print("Delete: \(indexPath.row)")
            let books = LibraryUserDefaults()
            books.remover(indice: indexPath.row)
            atualizarListaTarefas()
        }
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReadingNowTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? ReadingNowTableViewCell else { return UITableViewCell() }
        
        return cell
    }

    func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ReadingNowTableViewCell else { return }
        
        cell.lbTrackName?.text = books[indexPath.row]
        let url = URL(string: "\(imagens[indexPath.row])")
        cell.ivArtworkUrl60.kf.setImage(with: url)
        cell.addFavorite.isEnabled = false
        cell.addFavorite.tintColor = .red
        
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let svc = SFSafariViewController(url: NSURL(string: "\(urls[indexPath.row])")! as URL)
        self.present(svc, animated: true, completion: nil)
        svc.delegate = self
        
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
           controller.dismiss(animated: true, completion: nil)
       }
}


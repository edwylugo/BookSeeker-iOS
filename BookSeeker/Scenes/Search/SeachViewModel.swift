//
//  SeachViewModel.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//


import Foundation

protocol SearchNavigationProtocol: AnyObject {
    func gotoBookDetail(books: Book)
}

protocol SearchViewModelProtocol {
    var dataSource: Observable<[Book]> { get }
    var error: Observable<Error?> { get }
    func setDataSource()
    func didSelectItemAt(indexPath: IndexPath)
    mutating func filterBooks(search: String?)
}

struct SearchViewModel: SearchViewModelProtocol {
    private weak var navigationDelegate: SearchNavigationProtocol?
    var dataSource: Observable<[Book]> {
        if filterEnable {
            return bookFilter
        } else {
            return bookNoFilter
        }
    }
    var error: Observable<Error?>
    var filterEnable = false
    
    private var bookFilter: Observable<[Book]> = Observable([])
    private var bookNoFilter: Observable<[Book]> = Observable([])
    
    init(navigationDelegate: SearchNavigationProtocol? = nil) {
        self.navigationDelegate = navigationDelegate
        self.error = Observable(nil)
        setDataSource()
    }
    
    func setDataSource() {
        
        BookREST.loadBook(onComplete: { books in
            self.dataSource.value = books.results.ordenationsToBook()
        }) { error in
            DispatchQueue.main.async {
                print(error)
                switch error {
                case .url:
                    print("Não foi possível carregar a URL")
                case let .taskerror(error):
                    CommonToUI.sharedInstance.showAlert("IPM Informa:", "Para visualizar os Livros é necessário estar conectado com a internet.", nil)
                    print("\(error)")
                case let .noResponse(error):
                    CommonToUI.sharedInstance.showAlert(error.localizedDescription, "Serviço fora do ar. Entre em contato com a equipe técnica para visualizar as notas encerradas.", nil)
                case .noData:
                    print("Não foi possível carregar os dados para visualizar os Livros.")
                case let .responseStatusCode(code):
                    CommonToUI.sharedInstance.showAlert("IPM Informa:", "Verificamos que o servidor está fora do ar (Status: \(code).", nil)
                case let .invalidJSON(error):
                    CommonToUI.sharedInstance.showAlert(error.localizedDescription, "Uma nova estrutura foi criada pela equipe de desenvolvedores. Entre em contato com a equipe técnica.", nil)
                }
            }
        }
        
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
          guard dataSource.value.indices.contains(indexPath.row) else { return }
          let item = dataSource.value[indexPath.row]
          navigationDelegate?.gotoBookDetail(books: item)
      }
    
    mutating func filterBooks(search: String?) {
           if let text = search?.uppercased(), text != "" {
               filterEnable = true

                bookFilter.value = bookNoFilter.value.filter { books -> Bool in
                    books.name.uppercased().contains(text.uppercased()) ||
                    books.artist.uppercased().contains(text.uppercased()) ||
                    books.description.uppercased().contains(text.uppercased()) ||
                    books.price?.uppercased().contains(text.uppercased()) ?? false
               }

           } else {
               filterEnable = false
               bookFilter.value = []
           }
       }
}

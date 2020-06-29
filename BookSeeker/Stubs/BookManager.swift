//
//  BookManager.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

class BookManager {
    let books: [BookResponse]
    
    init() {
        let fileURL = Bundle.main.url(forResource: "book-response", withExtension: "json")!
        do {
            let decoder = JSONDecoder()
            let booksData = try Data(contentsOf: fileURL)
            books = [try decoder.decode(BookResponse.self, from: booksData)]
            print("Lista: \(books.count)")
        } catch let parsingError {
            print("Error", parsingError)
            books = []
            return
        }
    }
}

//
//  LibraryUserDefaults.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 29/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

class LibraryUserDefaults {
    
    let key = "listBooks"
    let keyImage = "listBooksImage"
    let keyUrl = "listBooksURL"
    var myBooks: [String] = []
    var myImages: [String] = []
    var myURLs: [String] = []
    
    func remover(indice: Int) {
           //Recuperar livros já salvas
           myBooks = listar()
           myImages = listarImagens()
           myURLs = listarUrls()
           myBooks.remove(at: indice)
           myImages.remove(at: indice)
           myURLs.remove(at: indice)
           UserDefaults.standard.set(myBooks, forKey: key)
           UserDefaults.standard.set(myImages, forKey: keyImage)
           UserDefaults.standard.set(myURLs, forKey: keyUrl)
    }
    
    func salvar(myBook: String, myImage: String, myURL: String) {
           //Recuperar livros já salvas
           myBooks = listar()
           myImages = listarImagens()
           myURLs = listarUrls()
           
           //Salvar livro
           myBooks.append(myBook)
           myImages.append(myImage)
           myURLs.append(myURL)
           UserDefaults.standard.set(myBooks, forKey: key)
           UserDefaults.standard.set(myImages, forKey: keyImage)
           UserDefaults.standard.set(myURLs, forKey: keyUrl)
       }
    
    func listar() -> Array<String> {
        
        let dados = UserDefaults.standard.object(forKey: key)
    
        if dados != nil {
            return dados as! Array<String>
        } else {
            return []
        }
    }
    
    func listarImagens() -> Array<String> {
         
         let dados = UserDefaults.standard.object(forKey: keyImage)
     
         if dados != nil {
             return dados as! Array<String>
         } else {
             return []
         }
     }
    
    func listarUrls() -> Array<String> {
          
          let dados = UserDefaults.standard.object(forKey: keyUrl)
      
          if dados != nil {
              return dados as! Array<String>
          } else {
              return []
          }
      }
    
    
    
    
    
    
    
}

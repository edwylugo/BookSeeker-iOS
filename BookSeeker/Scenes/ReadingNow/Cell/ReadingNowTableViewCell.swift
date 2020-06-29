//
//  ReadingNowTableViewCell.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit
import Kingfisher


class ReadingNowTableViewCell: UITableViewCell {
    
    var item: String = ""
    var position: Int = 0
    var imagem: String = ""
    var urlSave: String = ""
    
    @IBOutlet weak var ivArtworkUrl60: UIImageView!
    @IBOutlet weak var lbTrackName: UILabel!
    @IBOutlet var addFavorite: UIButton!
    @IBAction func buttonPressed(sender: AnyObject) {

        if let button = sender as? UIButton {
            if button.isSelected {
                // set deselected
                button.isSelected = false
                button.tintColor = .darkGray
                
                let book = LibraryUserDefaults()
                book.remover(indice: position)
                
                //Visualizar no log
                let dados = book.listar()
                print(dados)
                
            } else {
                // set selected
                button.isSelected = true
                let book = LibraryUserDefaults()
                book.salvar(myBook: item, myImage: imagem, myURL: urlSave)
                
                //Visualizar no log
                let dados = book.listar()
                print(dados)
                
                button.tintColor = .red
                
            }
        }
    }
    
    
    
      class var reuseIdentifier: String {
         return "ReadingNowTableViewCell"
     }

     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
     }
    
    func setup(viewModel: Book, indexPath: Int) {
        lbTrackName.text = viewModel.name
        let url = URL(string: "\(viewModel.cover)")
        ivArtworkUrl60.kf.setImage(with: url)
        item = viewModel.name
        imagem = viewModel.cover
        urlSave = viewModel.trackViewUrl
        position = indexPath
        
        
    }

    
}

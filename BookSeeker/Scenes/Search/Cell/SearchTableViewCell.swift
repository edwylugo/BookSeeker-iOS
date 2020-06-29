//
//  SearchTableViewCell.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 29/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var ivBook: UIImageView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbArtist: UILabel!
    @IBOutlet var price: UILabel!
    
     class var reuseIdentifier: String {
        return "SearchTableViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(viewModel: Book) {
        lbTitle.text = viewModel.name
        let url = URL(string: "\(viewModel.cover)")
        ivBook.kf.setImage(with: url)
        lbArtist.text = viewModel.artist
        price.text = viewModel.price
        
        if viewModel.price != "Gratuito" {
            price.textColor = .systemBlue
        } else {
            price.textColor = .systemGreen
        }
    }
    
}

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
    
    @IBOutlet weak var ivArtworkUrl60: UIImageView!
    @IBOutlet weak var lbTrackName: UILabel!
    
      class var reuseIdentifier: String {
         return "ReadingNowTableViewCell"
     }

     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
     }
    
    func setup(viewModel: Book) {
        lbTrackName.text = viewModel.name
        let url = URL(string: "\(viewModel.cover)")
        ivArtworkUrl60.kf.setImage(with: url)

    }
    
}

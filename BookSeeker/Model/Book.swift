//
//  Book.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

public struct Book: Codable {
    let bookId: Int
    let name: String
    let description: String
    let cover: String
    let artist: String
    let artistUrl: String
    let rating: Double?
    let genres: [String]
    let formattedPrice: String
    let trackViewUrl: String
    var price: String? {
        var result: String = ""
        
        if formattedPrice == "Free" {
            result = "Gratuito"
        } else {
            result = formattedPrice
        }
        return result
    }

    enum CodingKeys: String, CodingKey {
        case bookId = "trackId"
        case name = "trackName"
        case description
        case cover = "artworkUrl100"
        case artist = "artistName"
        case artistUrl = "artistViewUrl"
        case rating = "averageUserRating"
        case genres
        case formattedPrice
        case trackViewUrl
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        bookId = try container.decode(Int.self, forKey: .bookId)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        cover = try container.decode(String.self, forKey: .cover)
        artist = try container.decode(String.self, forKey: .artist)
        artistUrl = try container.decode(String.self, forKey: .artistUrl)
        genres = try container.decode([String].self, forKey: .genres)
        formattedPrice = try container.decode(String.self, forKey: .formattedPrice)
        trackViewUrl  = try container.decode(String.self, forKey: .trackViewUrl)

        let decodedRating = try? container.decode(Double.self, forKey: .rating)
        rating = decodedRating ?? nil
    }
}


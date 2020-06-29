//
//  BookResponse.swift
//  BookSeeker
//
//  Created by Edwy Lugo on 28/06/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

struct BookResponse: Codable {
    let total: Int
    let results: [Book]

    enum CodingKeys: String, CodingKey {
        case total = "resultCount"
        case results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        total = try container.decode(Int.self, forKey: .total)
        results = try container.decode([Book].self, forKey: .results)
    }
}



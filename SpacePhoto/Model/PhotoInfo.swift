//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by Руслан Акберов on 29.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
    
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum Keys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: Keys.self)
        title = try valueContainer.decode(String.self, forKey: Keys.title)
        description = try valueContainer.decode(String.self, forKey: Keys.description)
        url = try valueContainer.decode(URL.self, forKey: Keys.url)
        copyright = try valueContainer.decode(String.self, forKey: Keys.copyright)
    }
    
}



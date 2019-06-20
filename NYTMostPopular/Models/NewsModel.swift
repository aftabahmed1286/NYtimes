//
//  NewsModel.swift
//  NYTMostPopular
//
//  Created by Aftab Ahmed on 4/3/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import Foundation

struct NewsModel: Codable {
    var title: String?
    var url: URL?
    var byLine: String?
    var publishedDate: String?
    var views: Int?
    var media: [MediaModel]?
    
    enum CodingKeys: String, CodingKey {
        case title, url, byLine
        case publishedDate = "published_date"
        case views, media
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.url = try container.decodeIfPresent(URL.self, forKey: .url)
        self.byLine = try container.decodeIfPresent(String.self, forKey: .byLine)
        self.publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate)
        self.views = try container.decodeIfPresent(Int.self, forKey: .views)
        self.media = try container.decodeIfPresent([MediaModel].self, forKey: .media)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.byLine, forKey: .byLine)
        try container.encode(self.publishedDate, forKey: .publishedDate)
        try container.encode(self.views, forKey: .views)
        try container.encode(self.media, forKey: .media)
    }
}

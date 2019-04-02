//
//  NewsModel.swift
//  NYTMostPopular
//
//  Created by Aftab Ahmed on 4/3/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import Foundation

struct NewsModel {
    var title: String
    var url: URL
    var byLine: String
    var publishedDate: String
    var views: Int
    var media: [MediaModel]
    
    init(_ dict: [String: Any]) {
        let urlString = dict["url"] as? String ?? ""
        self.url = URL(string: urlString)!
        self.title = dict["title"] as? String ?? ""
        self.byLine = dict["byline"] as? String ?? ""
        self.publishedDate = dict["published_date"] as? String ?? ""
        self.views = dict["views"] as? Int ?? 0
        
        let mediaJSONDict = dict["media"] as? [[String: Any]] ?? []
        self.media = mediaJSONDict.compactMap{
            MediaModel($0)
        }
    }
}

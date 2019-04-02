//
//  MediaMetadataModel.swift
//  NYTMostPopular
//
//  Created by Aftab Ahmed on 4/2/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import Foundation

struct MediaMetadataModel {
    var url: URL
    var format: String
    var height: Double
    var width: Double
    
    init (_ dict: [String: Any]) {
        self.format = dict["format"] as? String ?? ""
        self.height = dict["height"] as? Double ?? 0.0
        self.width = dict["width"] as? Double ?? 0.0
        let urlString = dict["url"] as? String ?? ""
        self.url = URL(string: urlString)!
    }
}

struct MediaModel {
    var type: String
    var subtype: String
    var caption: String
    var copyright: String
    var medaiMetadata: [MediaMetadataModel]
    
    init(_ dict: [String: Any]) {
        self.type = dict["type"] as? String ?? ""
        self.subtype = dict["subtype"] as? String ?? ""
        self.caption = dict["caption"] as? String ?? ""
        self.copyright = dict["copyright"] as? String ?? ""
        let mediaMetaDataJSONDict = dict["media-metadata"] as? [[String: Any]] ?? []
        self.medaiMetadata = mediaMetaDataJSONDict.compactMap{
            MediaMetadataModel($0)
        }
    }
    
}

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

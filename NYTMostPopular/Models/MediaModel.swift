//
//  MediaModel.swift
//  NYTMostPopular
//
//  Created by Aftab Ahmed on 4/3/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import Foundation

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

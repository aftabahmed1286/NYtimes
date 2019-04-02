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

//
//  PhotoInfo.swift
//  hw3
//
//  Created by Elizabeth Dobryanskaya on 22/12/2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import Foundation

struct PhotoInfo {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
    init?(json: [String: Any]) {
        
        guard
            let albumId = json["albumId"] as? Int,
            let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let url = json["url"] as? String,
            let thumbnailUrl = json["thumbnailUrl"] as? String
            else {
                return nil
        }
        
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
}

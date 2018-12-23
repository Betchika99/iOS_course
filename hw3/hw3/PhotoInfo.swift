//
//  PhotoInfo.swift
//  hw3
//
//  Created by Elizabeth Dobryanskaya on 22/12/2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import Foundation
import RealmSwift

class PhotoInfo: Object {
    @objc dynamic var albumId: String = ""
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var thumbnailUrl: String = ""
    
    override static func primaryKey() -> String?{
        return "id"
    }
//    init?(json: [String: Any]) {
//
//        guard
//            let albumId = json["albumId"] as? String,
//            let id = json["id"] as? String,
//            let title = json["title"] as? String,
//            let url = json["url"] as? String,
//            let thumbnailUrl = json["thumbnailUrl"] as? String
//            else {
//                return nil
//        }
//
//        self.albumId = albumId
//        self.id = id
//        self.title = title
//        self.url = url
//        self.thumbnailUrl = thumbnailUrl
//    }
}

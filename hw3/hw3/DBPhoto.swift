//
//  DBPhoto.swift
//  hw3
//
//  Created by Elizabeth Dobryanskaya on 26/12/2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import Foundation
import RealmSwift

class DBPhoto {
    static func readOnDB() -> [PhotoInfo] {
        let realm = try! Realm()
        print(realm.configuration.fileURL!)
        let dbPhotos = realm.objects(PhotoInfo.self)
        var photos: [PhotoInfo] = []
        for photo in dbPhotos {
            let current = PhotoInfo()
            current.id = photo.id
            current.title = photo.title
            current.url = photo.url
            photos.append(current)
        }
        return photos
    }
    
    static func writeToDB(photos: [PhotoInfo]) {
        let realm = try! Realm()
        for photo in photos {
            let current = PhotoInfo()
            current.id = photo.id
            current.title = photo.title
            current.url = photo.url
            try! realm.write {
                realm.add(current, update: true)
            }
        }
    }
}

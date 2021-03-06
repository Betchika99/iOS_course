//
//  PhotoModel.swift
//  hw3
//
//  Created by Elizabeth Dobryanskaya on 23/12/2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

enum ModelStatus {
    case inited
    case loading
    case error
    case success
}

class PhotoModel {
    var status = ModelStatus.inited
    var photo: UIImage?
    var photoURL: String
    init(url: String){
        self.photoURL = url
    }
    
    func loadPhoto(successBlock: @escaping (PhotoModel) -> (),
                   errorBlock: @escaping () -> ()) {
        status = .loading
        DispatchQueue.global().async {
            sleep(3)
            Alamofire.request(self.photoURL).responseImage { response in
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {return}
                    switch response.result {
                    case .success:
                        self.status = .success
                        self.photo = response.result.value
                        successBlock(self)
                    case .failure(let error):
                        print("PIPEC_ERROR:",error)
                        self.status = .error
                        errorBlock()
                    }
                }
            }
        }
    }
}

//
//  MainCollectionViewCell.swift
//  hw3
//
//  Created by Elizabeth Dobryanskaya on 22/12/2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainActivator: UIActivityIndicatorView!
    func configureWith(model: PhotoModel) {
        if model.status == .inited {
            model.loadPhoto(successBlock: {
                [weak self] loadedModel in
                // то же самое, что и .success
                guard let self = self else {return}
                self.mainActivator.stopAnimating()
                self.mainImageView.image = model.photo
                }, errorBlock: {
                    [weak self] in
                    guard let self = self else {return}
                    // то же самое, что и .error
            })
        }
        if model.status == .loading {
            mainActivator.startAnimating()
        }
        if model.status == .success {
            mainActivator.stopAnimating()
            mainActivator.hidesWhenStopped = true
            mainImageView.image = model.photo
        }
        if model.status == .error {
            
        }
    }
    
}

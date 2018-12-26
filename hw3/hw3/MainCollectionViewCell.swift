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
    @IBOutlet weak var bitView: UIView!
    @IBOutlet weak var retryButton: UIButton!
    
    func configureWith(model: PhotoModel) {
        if model.status == .inited {
            model.loadPhoto(successBlock: {
                [weak self] loadedModel in
                // то же самое, что и .success
                guard let self = self else {return}
                self.mainActivator.stopAnimating()
                self.mainImageView.isHidden = false
                self.mainImageView.image = model.photo
                self.bitView.isHidden = true
                }, errorBlock: {
                    [weak self] in
                    guard let self = self else {return}
                    // то же самое, что и .error
                    self.mainActivator.stopAnimating()
                    self.mainImageView.isHidden = true
                    self.bitView.isHidden = false
            })
        }
        if model.status == .loading {
            mainActivator.startAnimating()
            mainImageView.isHidden = false
            bitView.isHidden = true
        }
        if model.status == .success {
            mainActivator.stopAnimating()
            mainActivator.hidesWhenStopped = true
            mainImageView.image = model.photo
            mainImageView.isHidden = false
            bitView.isHidden = true
        }
        if model.status == .error {
            mainActivator.stopAnimating()
            mainImageView.isHidden = true
            bitView.isHidden = false
        }
        
    }
    
    var index: Int?
    
}

//
//  BitCollectionViewCell.swift
//  hw3
//
//  Created by Elizabeth Dobryanskaya on 23/12/2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import UIKit

class BitCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bitView: UIView!
    @IBOutlet weak var bitImageView: UIImageView!
    @IBOutlet weak var retryButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var index: Int?
    

}

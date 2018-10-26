//
//  MainTableViewCell.swift
//  DocumentViewer
//
//  Created by Elizabeth Dobryanskaya on 18.10.2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var documentName: UILabel!
    @IBOutlet weak var documentImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

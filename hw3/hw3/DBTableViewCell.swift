//
//  DBTableViewCell.swift
//  hw3
//
//  Created by Elizabeth Dobryanskaya on 26/12/2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import UIKit

class DBTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

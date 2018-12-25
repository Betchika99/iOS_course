//
//  TableViewController.swift
//  hw3
//
//  Created by Elizabeth Dobryanskaya on 25/12/2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import UIKit

class TableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let photoInfos: [PhotoModel] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        let titleIndex = indexPath.row/3;
        cell.documentName.text = nameDocuments[indexPath.row - titleIndex]
        cell.documentImageView.image = UIImage(named: "Image")
        return cell */
        return UITableViewCell()
    }
    
}

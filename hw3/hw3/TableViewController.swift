//
//  TableViewController.swift
//  hw3
//
//  Created by Elizabeth Dobryanskaya on 25/12/2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import UIKit

class TableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dbPhotos: [PhotoInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbPhotos = DBPhoto.readOnDB()
        tableView.dataSource = self
        tableView.delegate = self
        let mainNib = UINib.init(nibName: "DBTableViewCell", bundle: nil)
        tableView.register(mainNib, forCellReuseIdentifier: "DBTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dbPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DBTableViewCell", for: indexPath) as! DBTableViewCell
        cell.idLabel.text = "ID:\(dbPhotos[indexPath.item].id)"
        cell.titleLabel.text = "Title:\(dbPhotos[indexPath.item].title)"
        cell.urlLabel.text = "URL:\(dbPhotos[indexPath.item].url)"
        return cell
    }
    
}

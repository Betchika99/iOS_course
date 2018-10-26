//
//  ViewController.swift
//  DocumentViewer
//
//  Created by Elizabeth Dobryanskaya on 18.10.2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let nameDocuments = ["Пропуск", "Студенческий билет", "Зачетная книжка", "Читательский билет", "Социальная карта", "Паспорт здоровья", "Медицинский полис", "СНИЛС", "Медицинская книжка", "Аттестат", "Диплом", "ИНН"]
    
    @IBOutlet weak var myDocumentsTable: UITableView!
    
    private let refresher = UIRefreshControl()
    
    func refresh_properties(){
        if #available(iOS 10.0, *) {
            myDocumentsTable.refreshControl = refresher
        } else {
            myDocumentsTable.addSubview(refresher)
        }
        refresher.addTarget(self, action: #selector(refresherStop(_:)), for: .valueChanged)
    }
    
    @objc private func refresherStop(_ sender: Any) {
        stop_refresh()
    }
    
    func stop_refresh() {
        refresher.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameDocuments.count+nameDocuments.count/2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row % 3 == 2) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdvTableViewCell", for: indexPath) as! AdvTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        let titleIndex = indexPath.row/3;
        cell.documentName.text = nameDocuments[indexPath.row - titleIndex]
        cell.documentImageView.image = UIImage(named: "Image")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row % 3 != 2) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let fullInfoViewController = storyboard.instantiateViewController(withIdentifier: "FullDocumentID") as! FullDocumentViewController
            let titleIndex = indexPath.row/3;
            fullInfoViewController.documentName = nameDocuments[indexPath.row - titleIndex]
            fullInfoViewController.image = UIImage(named: "Image")!
            self.navigationController?.pushViewController(fullInfoViewController, animated: true)
        }
    }

    @IBOutlet weak var cirlee: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainNib = UINib.init(nibName: "MainTableViewCell", bundle: nil)
        self.myDocumentsTable.register(mainNib, forCellReuseIdentifier: "MainTableViewCell")
        let advNib = UINib.init(nibName: "AdvTableViewCell", bundle: nil)
        self.myDocumentsTable.register(advNib, forCellReuseIdentifier: "AdvTableViewCell")
        // Do any additional setup after loading the view, typically from a nib.
        refresh_properties()
        cirlee.layer.cornerRadius = cirlee.frame.size.width/2
        cirlee.clipsToBounds = true
    }


}


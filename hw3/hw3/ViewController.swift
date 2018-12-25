//
//  ViewController.swift
//  hw3
//
//  Created by Elizabeth Dobryanskaya on 22/12/2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import RealmSwift

class ViewController: UIViewController,
                      UICollectionViewDataSource,
                      UICollectionViewDelegate,
                      UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var photos: [PhotoInfo] = []
    var models: [PhotoModel] = []
    var i = 0
    var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJSON()
        realm = try! Realm()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
       // print(realm.configuration.fileURL!)
    }
    
    func getJSON() {
        request("http://jsonplaceholder.typicode.com/photos").responseJSON { responseJSON in
            switch responseJSON.result {
                case .success(let value):
                    
                    guard let jsonArray = value as? Array<[String: Any]> else { return }
                    for jsonObject in jsonArray {
                        if (self.i == 27) {
                            break
                        }
                        let url = jsonObject["url"] as! String
                        let current = PhotoModel(url: url)
                        self.models.append(current)
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    self.i += 1
                 //   print(self.photos)
                
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    // кол-во ячеек в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (models.count > 0) {
            return 27
        } else {
            return models.count
        }
    }
    
    // задаем размеры ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 40) / 3
        return CGSize(width: width, height: width)
    }
    
    // возвращает ячейку по определенному индексу
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        print(models.count)
        let model = models[indexPath.item]
        cell.configureWith(model: model)
        return cell
      //  cell.mainImageView.backgroundColor = UIColor.green
//        let index = indexPath.section * 3 + indexPath.row
//        if (photos.isEmpty) {
//            print ("ERROR")
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BitCollectionViewCell", for: indexPath) as! BitCollectionViewCell
//            cell.index = index
//            return cell
//        }
//        else {
//            if (index % 10 == 0) {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BitCollectionViewCell", for: indexPath) as! BitCollectionViewCell
//                cell.index = index
//                cell.retryButton.tag = index
//                cell.retryButton.addTarget(self, action: #selector(reloadBitItem), for: .touchUpInside)
//                return cell
//            } else {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
//                let imgURL: NSURL = NSURL(string: photos[index].url)!
//                let imgData: NSData = NSData(contentsOf: imgURL as URL)!
//                cell.mainImageView.image = UIImage(data: imgData as Data)
//                return cell
//            }
//        }
    }
    
    // для перезагрузки определенных ячеек
    func reloadItemAtIndexPath(indexPath: IndexPath) {
        var indexArray: [IndexPath] = [IndexPath]()
        indexArray.append(indexPath)
        collectionView.reloadItems(at: indexArray)
    }
    
    @objc func reloadBitItem(sender: UIButton!) {
        print(sender.tag)
        let section = sender.tag / 3
        let row = sender.tag % 3
        let indexPath = NSIndexPath(row: row, section: section)
      /*  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath as IndexPath) as! MainCollectionViewCell
        let cell = collectionView.cellForItem(at: indexPath as IndexPath)
        cell.mainImageView.image = UIImage(named: "Catik")! */
        reloadItemAtIndexPath(indexPath: indexPath as IndexPath)
    }
}

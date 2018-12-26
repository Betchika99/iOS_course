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

protocol CellDelegate {
    func reloadCell(indexPath: IndexPath)
}

class ViewController: UIViewController,
                      UICollectionViewDataSource,
                      UICollectionViewDelegate,
                      UICollectionViewDelegateFlowLayout,
                      CellDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var models: [PhotoModel] = []
    var photos: [PhotoInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJSON()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
    
    func getJSON() {
        request("http://jsonplaceholder.typicode.com/photos").responseJSON { responseJSON in
            switch responseJSON.result {
                case .success(let value):
                    
                    guard let jsonArray = value as? Array<[String: Any]> else { return }
                    var i = 0
                    for jsonObject in jsonArray {
                        if (i == 50) {
                            break
                        }
                        var url = jsonObject["url"] as! String
                        let id = jsonObject["id"] as! Int
                        let title = jsonObject["title"] as! String
                        if (i % 10 == 0) {
                            url = "ERROR" + url
                        }
                        let currentModel = PhotoModel(url: url)
                        let currentInfo = PhotoInfo()
                        currentInfo.id = id
                        currentInfo.url = url
                        currentInfo.title = title
                        
                        self.models.append(currentModel)
                        self.photos.append(currentInfo)
                        i += 1
                    }
                    DBPhoto.writeToDB(photos: self.photos)
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    // кол-во ячеек в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
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
        cell.index = indexPath.item
        cell.bitView.isHidden = true
        cell.retryButton.addTarget(self, action: #selector(reloadCell), for: .touchUpInside)
        let model = models[indexPath.item]
        cell.configureWith(model: model)
        return cell

    }
    
    @objc func reloadCell(indexPath: IndexPath) {
        let model = models[indexPath.item]
        model.status = .inited
        model.photoURL = "https://avatars.mds.yandex.net/get-pdb/70729/28a1921d-1bbd-4d16-9a37-2e4c1ca0299d/s1200"
        reloadItemAtIndexPath(indexPath: indexPath)
    }
    
    // для перезагрузки определенных ячеек
    func reloadItemAtIndexPath(indexPath: IndexPath) {
        var indexArray: [IndexPath] = [IndexPath]()
        indexArray.append(indexPath)
        collectionView.reloadItems(at: indexArray)
    }
    
}

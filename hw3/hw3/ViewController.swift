//
//  ViewController.swift
//  hw3
//
//  Created by Elizabeth Dobryanskaya on 22/12/2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,
                      UICollectionViewDataSource,
                      UICollectionViewDelegate,
                      UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var photos: [PhotoInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        // регистрируем ниб-файлы
        collectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
        print ("0")
        getJSON()
    }
    
    func getJSON() {
        request("http://jsonplaceholder.typicode.com/photos").responseJSON { responseJSON in
            switch responseJSON.result {
                case .success(let value):
                    
                    guard let jsonArray = value as? Array<[String: Any]> else { return }
                    
                    for jsonObject in jsonArray {
                        guard let photo = PhotoInfo(json: jsonObject) else { return }
                        self.photos.append(photo)
                    }
                 //   print(self.photos)
                
                case .failure(let error):
                    print(error)
            }
        }
        print ("1")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    // кол-во ячеек в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 27
    }
    
    // задаем размеры ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 40) / 3
        return CGSize(width: width, height: width)
    }
    
    // возвращает ячейку по определенному индексу
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print ("2")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
      //  cell.mainImageView.backgroundColor = UIColor.green
        let index = indexPath.row * 3 + indexPath.section
        if (photos.isEmpty) { print ("ERROR") }
        else { let imgURL: NSURL = NSURL(string: photos[index].url)!
        let imgData: NSData = NSData(contentsOf: imgURL as URL)!
        cell.mainImageView.image = UIImage(data: imgData as Data)
        }
        return cell
    }
    
    // для перезагрузки определенных ячеек
    func reloadItemAtIndexPath() {
        var indexArray: [IndexPath] = [IndexPath]()
        indexArray.append(IndexPath(row: 0, section: 1))
        indexArray.append(IndexPath(row: 0, section: 0))
        collectionView.reloadItems(at: indexArray)
    }
}

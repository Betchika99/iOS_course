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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request("http://jsonplaceholder.typicode.com/photos").validate().responseJSON { responseJSON in
            
            switch responseJSON.result {
                case .success(let value):
                    print(value)
                case .failure(let error):
                    print(error)
            }
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        // регистрируем ниб-файлы
        collectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
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


//
//  BigImageViewController.swift
//  DocumentViewer
//
//  Created by Elizabeth Dobryanskaya on 18.10.2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import UIKit

class BigImageViewController: UIViewController {
    
    @IBOutlet weak var bigImageView: UIImageView!
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigImageView.image = image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

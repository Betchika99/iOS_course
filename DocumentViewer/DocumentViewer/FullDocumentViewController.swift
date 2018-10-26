//
//  FullDocumentViewController.swift
//  DocumentViewer
//
//  Created by Elizabeth Dobryanskaya on 18.10.2018.
//  Copyright © 2018 Елизавета Добрянская. All rights reserved.
//

import UIKit

class FullDocumentViewController: UIViewController {
    @IBOutlet weak var fullImageView: UIImageView!
    @IBOutlet weak var fullImageLabel: UILabel!
    
    var documentName = ""
    var image = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        fullImageView.image = image
        fullImageLabel.text = documentName
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        fullImageView.isUserInteractionEnabled = true
        fullImageView.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let bigImageController = storyboard.instantiateViewController(withIdentifier: "bigImageViewController") as! BigImageViewController
        bigImageController.image = fullImageView.image!
        self.navigationController?.pushViewController(bigImageController, animated: true)
        
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

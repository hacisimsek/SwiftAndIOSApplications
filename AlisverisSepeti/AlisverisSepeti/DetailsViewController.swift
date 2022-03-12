//
//  DetailsViewController.swift
//  AlisverisSepeti
//
//  Created by Hacı Şimşek on 5.02.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isimTextField: UITextField!
    @IBOutlet weak var fiyatTextField: UITextField!
    @IBOutlet weak var bedenTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(gestureRecognizer)
    }
    @objc func klavyeyiKapat(){
        view.endEditing(true)
            
    }
    
    @IBAction func submitButton(_ sender: Any) {
    }
    
}

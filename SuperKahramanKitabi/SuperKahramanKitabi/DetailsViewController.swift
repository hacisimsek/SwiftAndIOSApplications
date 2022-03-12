//
//  DetailsViewController.swift
//  SuperKahramanKitabi
//
//  Created by Hacı Şimşek on 30.01.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var superKahramanImage: UIImageView!
    @IBOutlet weak var superKahramanLabel: UILabel!
    
    var secilenKahramanIsmi = ""
    var secilenKahramanImage = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        superKahramanImage.image = UIImage(named: secilenKahramanImage)
        superKahramanLabel.text = secilenKahramanIsmi
    }
    

   
}

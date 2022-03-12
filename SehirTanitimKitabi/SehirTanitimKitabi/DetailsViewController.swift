//
//  DetailsViewController.swift
//  SehirTanitimKitabi
//
//  Created by Hacı Şimşek on 2.02.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var cityArea: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    
    var secilenSehir : Cities?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityName.text = secilenSehir?.isim
        cityArea.text = secilenSehir?.bolge
        cityImage.image = secilenSehir?.gorsel
    }
    

    

}

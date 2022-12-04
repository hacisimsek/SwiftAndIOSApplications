//
//  ViewController3.swift
//  Sayi Tahmin Et
//
//  Created by Simsek Haci on 2.12.2022.
//

import UIKit

class SonucEkraniVC: UIViewController {
    
    
    @IBOutlet weak var imageViewResult: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    
    var sonuc:Bool?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        self.navigationItem.title = "Sonuç Ekranı"
        
        print(sonuc!)
        
        if sonuc! {
            labelResult.text = "Kazandınız"
            imageViewResult.image = UIImage(named: "mutlu_resim")
        }else{
            labelResult.text = "Kaybettiniz"
            imageViewResult.image = UIImage(named: "uzgun_resim")
        }
    }
    

    @IBAction func OyunuBaşlat(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}

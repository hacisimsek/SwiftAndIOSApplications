//
//  ViewController2.swift
//  Sayi Tahmin Et
//
//  Created by Simsek Haci on 2.12.2022.
//

import UIKit

class TahminEkraniVC: UIViewController {

    @IBOutlet weak var LabelKalanHak: UILabel!
    @IBOutlet weak var LabelArttırAzalt: UILabel!
    @IBOutlet weak var TextFieldInput: UITextField!
    
    var rasgeleSayi:Int?
    var kalanHak = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rasgeleSayi = Int(arc4random_uniform(100))
        
        print(rasgeleSayi!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenVeri = sender as? Bool {
            let gidilecekVc = segue.destination as! SonucEkraniVC
            gidilecekVc.sonuc = gelenVeri
        }
    }

    @IBAction func TahminEt(_ sender: Any) {
        LabelArttırAzalt.isHidden = false
        kalanHak -= 1
        
        if let veri = TextFieldInput.text {
            if let tahmin = Int(veri){
                if kalanHak != 0 {
                    if tahmin == rasgeleSayi!{
                        let sonuc = true
                        performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                        
                    }
                    if tahmin > rasgeleSayi!{
                        LabelArttırAzalt.text = "Azalt"
                        LabelKalanHak.text = "Kalan Hak : \(kalanHak)"
                    }
                    if tahmin < rasgeleSayi!{
                        LabelArttırAzalt.text = "Arttır"
                        LabelKalanHak.text = "Kalan Hak : \(kalanHak)"
                    }
                }else{
                    let sonuc = false
                    performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)

                }
                TextFieldInput.text = ""
            }
        }
    }
}

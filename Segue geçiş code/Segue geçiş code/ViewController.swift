//
//  ViewController.swift
//  Segue geçiş code
//
//  Created by Simsek Haci on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func got2(_ sender: Any) {
        let veri = "merhaba"
        
        let nesne = Kisiler(kisiId: 1 , kisiAd: "Ahmet")
        performSegue(withIdentifier: "gofrom1to2", sender: nesne)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let gelenVeri = sender as? Kisiler
        
        print("Gelen Veri : \(gelenVeri!.kisiId!)  \(gelenVeri!.kisiAd!)")
        print("getiş 1den 2 ye")
    }
    
}


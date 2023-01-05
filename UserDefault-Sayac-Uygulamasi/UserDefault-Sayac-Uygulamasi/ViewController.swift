//
//  ViewController.swift
//  UserDefault-Sayac-Uygulamasi
//
//  Created by haci.simsek on 5.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let d = UserDefaults.standard
        
        var sayac = d.integer(forKey: "sayac")
        
        sayac = sayac + 1
        
        d.set(sayac,forKey: "sayac")
        
        label.text = "Sayac : \(sayac)"
        
    }


}


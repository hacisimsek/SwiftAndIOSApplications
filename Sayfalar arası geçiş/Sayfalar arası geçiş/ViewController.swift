//
//  ViewController.swift
//  Sayfalar arası geçiş
//
//  Created by Simsek Haci on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var girdiAlani: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendItem(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let gidilecekViewController = storyboard.instantiateViewController(withIdentifier: "sayfa2") as! ViewController2
        
        let gönderilecekMesaj = girdiAlani.text
        
        gidilecekViewController.mesaj = gönderilecekMesaj!
        
        self.present(gidilecekViewController, animated: true, completion: nil)
        
        
    }
    
}


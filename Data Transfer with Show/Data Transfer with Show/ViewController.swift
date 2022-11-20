//
//  ViewController.swift
//  Data Transfer with Show
//
//  Created by Simsek Haci on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var textName: UITextField!
    
    var kisiler = Kisiler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendItem(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
             let textId = text.text
             let textName = textName.text

             if textId != nil && textName != nil {
                 kisiler.kisiId = textId
                 kisiler.kisiAd = textName
                 vc.kisiler = kisiler
//                 vc.kisiId = textId
//                 vc.kisiName = textName
             }
             navigationController?.pushViewController(vc, animated: true)
        

    }
    

}


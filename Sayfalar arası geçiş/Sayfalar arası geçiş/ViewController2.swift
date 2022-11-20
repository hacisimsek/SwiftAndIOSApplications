//
//  ViewController2.swift
//  Sayfalar arası geçiş
//
//  Created by Simsek Haci on 20.11.2022.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var etiket: UILabel!
    
    var mesaj:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        etiket.text = mesaj!
    }
    
    @IBAction func goto1(_ sender: Any) {
        dismiss(animated: true)
    }
    

}

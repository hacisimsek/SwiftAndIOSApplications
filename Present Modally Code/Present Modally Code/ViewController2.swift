//
//  ViewController2.swift
//  Present Modally Code
//
//  Created by Simsek Haci on 18.11.2022.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goto3(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let gidilecekViewController = storyboard.instantiateViewController(withIdentifier: "sayfa3") as! ViewController3
        
        self.present(gidilecekViewController, animated: true, completion: nil)
    }
    
    @IBAction func gotodismiss(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}

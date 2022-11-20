//
//  ViewController2.swift
//  show segue code
//
//  Created by Simsek Haci on 19.11.2022.
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
        navigationController?.pushViewController(gidilecekViewController, animated: true)
    }
    

}

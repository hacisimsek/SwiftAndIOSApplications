//
//  ViewController3.swift
//  show segue code
//
//  Created by Simsek Haci on 19.11.2022.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goto1(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let gidilecekViewController = storyboard.instantiateViewController(withIdentifier: "sayfa1") as! ViewController
        navigationController?.pushViewController(gidilecekViewController, animated: true)
    }
    

}

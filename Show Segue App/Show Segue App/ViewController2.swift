//
//  ViewController2.swift
//  Show Segue App
//
//  Created by Simsek Haci on 19.11.2022.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gotoback(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

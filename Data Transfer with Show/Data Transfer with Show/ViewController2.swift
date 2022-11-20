//
//  ViewController2.swift
//  Data Transfer with Show
//
//  Created by Simsek Haci on 20.11.2022.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var textId: UILabel!
    @IBOutlet weak var textName: UILabel!
    
//    var kisiId: String?
//    var kisiName: String?

    var kisiler: Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        guard let kisiId = kisiId else { return }
//        guard let kisiName = kisiName else { return }
//
        guard let kisiId = kisiler?.kisiId else { return }
        guard let kisiName = kisiler?.kisiAd else { return }
        textId.text = kisiId
        textName.text = kisiName
    }
    
    
    



}

//
//  Cities.swift
//  SehirTanitimKitabi
//
//  Created by Hacı Şimşek on 2.02.2022.
//

import Foundation
import UIKit

class Cities {
    var isim : String
    var bolge : String
    var gorsel : UIImage
    
    init(isim : String , bolge: String, gorsel : UIImage){
        self.isim = isim
        self.bolge = bolge
        self.gorsel = gorsel
        
    }
}

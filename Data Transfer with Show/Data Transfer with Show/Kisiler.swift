//
//  Kisiler.swift
//  Data Transfer with Show
//
//  Created by Simsek Haci on 20.11.2022.
//

import Foundation

struct Kisiler {
    
    var kisiId:String?
    var kisiAd:String?
    
    init(kisiId: String? = nil, kisiAd: String? = nil) {
        self.kisiId = kisiId
        self.kisiAd = kisiAd
    }
}

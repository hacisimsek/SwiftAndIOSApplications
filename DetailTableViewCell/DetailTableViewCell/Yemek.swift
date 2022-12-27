//
//  File.swift
//  DetailTableViewCell
//
//  Created by haci.simsek on 27.12.2022.
//

import Foundation

class Yemekler {
    var yemekId:Int?
    var yemekAdi:String?
    var yemekResimAdi:String?
    var yemekFiyat:Double?
    
    init(yemekId: Int? = nil, yemekAdi: String? = nil, yemekResimAdi: String? = nil, yemekFiyat: Double? = nil) {
        self.yemekId = yemekId
        self.yemekAdi = yemekAdi
        self.yemekResimAdi = yemekResimAdi
        self.yemekFiyat = yemekFiyat
    }
}

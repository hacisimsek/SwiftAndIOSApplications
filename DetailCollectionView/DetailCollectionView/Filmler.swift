//
//  Filmler.swift
//  DetailCollectionView
//
//  Created by haci.simsek on 28.12.2022.
//

import Foundation

class Filmler {
    var filmId:Int?
    var filmBaslik:String?
    var filmResimAdi:String?
    var filmfiyat:Double?
    
    init(){
        
    }
    
    init(filmId: Int, filmBaslik: String, filmResimAdi: String, filmfiyat: Double) {
        self.filmId = filmId
        self.filmBaslik = filmBaslik
        self.filmResimAdi = filmResimAdi
        self.filmfiyat = filmfiyat
    }
}

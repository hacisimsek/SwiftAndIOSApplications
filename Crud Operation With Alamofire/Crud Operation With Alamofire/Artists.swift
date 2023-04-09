//
//  Artists.swift
//  Crud Operation With Alamofire
//
//  Created by haci.simsek on 9.04.2023.
//

import Foundation

struct Artist: Codable {
    let results: [ArtistResults]
}

struct ArtistResults: Codable {
    let trackName: String
    let artistName: String
    let artworkUrl60: String
    let country: String
}

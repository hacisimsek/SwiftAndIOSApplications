//
//  SharedPreferenceManager.swift
//  UserDefault
//
//  Created by haci.simsek on 21.04.2023.
//

import Foundation

class SharedPreferenceManager : NSObject {
    static let instance = SharedPreferenceManager()
    let sharedPreferenc = UserDefaults.standard
    
    //Mark: -clear all data
    func clearAllPreference(){
        if let bundle = Bundle.main.bundleIdentifier{
            sharedPreferenc.removePersistentDomain(forName: bundle)
        }
    }
    
    //Mark: -setter methods
    func saveUserCredentals(_ username:String){
        sharedPreferenc.set(username,forKey: "username")
    }
    
    //Mark: -getter methods
    
    func getUserCredentils() -> String? {
        return sharedPreferenc.value(forKey: "username") as? String
    }
    
    
}

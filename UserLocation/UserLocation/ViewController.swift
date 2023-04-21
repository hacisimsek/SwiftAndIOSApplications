//
//  ViewController.swift
//  UserLocation
//
//  Created by haci.simsek on 21.04.2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    //Mark: -Variables
    @IBOutlet weak var locationLbl: UILabel!
    var location: CLLocationManager?
    
    //Mark: -Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        managerUserLocation()
    }
    private func managerUserLocation(){
        location = CLLocationManager()
        location?.delegate = self
        location?.requestAlwaysAuthorization()
        location?.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let location = locations.last {
            locationLbl.text = "Lat: \(location.coordinate.latitude)  Lng: \(location.coordinate.longitude)\n"
        }
        
    }
}

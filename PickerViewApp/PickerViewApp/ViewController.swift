//
//  ViewController.swift
//  PickerViewApp
//
//  Created by Simsek Haci on 15.12.2022.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var ulkeler:[String] = [String]()
    
    var secilenUlke:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ulkeler = ["Türkiye", "Almanya","Japonya","Rusya","İtalya"]
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        secilenUlke = ulkeler[row]
    }
    
    @IBAction func goster(_ sender: Any) {
        labelSonuc.text = secilenUlke
    }
    
}


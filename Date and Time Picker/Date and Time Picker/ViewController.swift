//
//  ViewController.swift
//  Date and Time Picker
//
//  Created by Simsek Haci on 11.12.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tarihTF: UITextField!
    @IBOutlet weak var saatTF: UITextField!
    
    var datePicker:UIDatePicker?
    
    var timePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tarihTF.inputView = datePicker
        
        timePicker = UIDatePicker()
        datePicker?.datePickerMode = .time
        saatTF.inputView = timePicker
        
        datePicker?.addTarget(self, action: #selector(self.tarihGoster(datePicker:)), for: .valueChanged)
        
        timePicker?.addTarget(self, action: #selector(self.saatGoster(datePicker:)), for: .valueChanged)
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgilamaMetod))
        
        view.addGestureRecognizer(dokunmaAlgilama)
        }
    
    @objc func tarihGoster(datePicker:UIDatePicker) {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let alinanTarih = dateFormatter.string(from: datePicker.date)
        print(datePicker.date)
        
        tarihTF.text = alinanTarih
        
//        view.endEditing(true)
    }
    @objc func saatGoster(datePicker:UIDatePicker) {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        let alinanSaat = dateFormatter.string(from: datePicker.date)
        print(datePicker.date)
        
        saatTF.text = alinanSaat
        
//        view.endEditing(true)
    }
    
    @objc func dokunmaAlgilamaMetod(){
        view.endEditing(true)
    }
}


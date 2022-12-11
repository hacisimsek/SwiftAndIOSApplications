//
//  ViewController.swift
//  Alert-Types
//
//  Created by Simsek Haci on 4.12.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var LabelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func basicAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        let iptalAction = UIAlertAction(title: "iptal", style: .cancel){
            action in
            print("İptal Tıklandı")
        }
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "tamam", style: .default){
            action in
            print("Tamam Tıklandı")
        }
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
    }
    
    @IBAction func ozelAlertGoster(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        
        alertController.addTextField{ textField in
            textField.placeholder = "Email.."
            textField.keyboardType = .emailAddress
            
        }
        
        alertController.addTextField{ textField in
            textField.placeholder = "Şifre.."
            textField.isSecureTextEntry = true
            
        }
        
        let kaydetAction = UIAlertAction(title: "Kaydet", style: .destructive){
            action in
            print("Kaydet Tıklandı")
            
            let alinanEmail = (alertController.textFields![0] as UITextField).text!
            let alinanSifre = (alertController.textFields![1] as UITextField).text!
            self.LabelResult.text = "Email:\(alinanEmail) Password:\(alinanSifre)"
        }
        alertController.addAction(kaydetAction)
        
        
        self.present(alertController, animated: true)
    }
    
  
    @IBAction func actionSheet(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .actionSheet)
        let iptalAction = UIAlertAction(title: "iptal", style: .cancel){
            action in
            print("İptal Tıklandı")
        }
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "tamam", style: .default){
            action in
            print("Tamam Tıklandı")
        }
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)

    }
}

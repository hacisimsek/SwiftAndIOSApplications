//
//  ViewController.swift
//  UserDefault
//
//  Created by haci.simsek on 21.04.2023.
//

import UIKit

class ViewController: UIViewController {

    //Mark: -Variables
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    //Mark: -Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func singinBtn(_ sender: UIButton) {
        if usernameText.text != "" && passwordText.text != "" {
            setData(username: usernameText.text!)
        } else {
            print("check fields")
        }
    }
    
    private func setData(username:String){
        SharedPreferenceManager.instance.saveUserCredentals(username)
        sleep(4)
        getData()
    }
    
    private func getData(){
        if let username = SharedPreferenceManager.instance.getUserCredentils(){
            infoLbl.text = username
        }
    }
    
}


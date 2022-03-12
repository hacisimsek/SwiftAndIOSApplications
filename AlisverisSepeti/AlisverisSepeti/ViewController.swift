//
//  ViewController.swift
//  AlisverisSepeti
//
//  Created by Hacı Şimşek on 5.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(eklemeButonuEklendi))
    }

    @objc func eklemeButonuEklendi(){
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
}


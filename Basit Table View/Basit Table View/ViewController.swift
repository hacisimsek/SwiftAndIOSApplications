//
//  ViewController.swift
//  Basit Table View
//
//  Created by Simsek Haci on 20.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var ulkeler:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye", "Almanya", "Japonya", "Rusya", "İtalya", "Güney Kore", "Fransa", "Mısır"]
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNumber))
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshNumbers))
        navigationItem.rightBarButtonItems = [addButton, refreshButton]
    }
    
        @objc func addNumber() {
          print("deeneme add")
        }

        @objc func refreshNumbers() {
            print("dneem ref")
        }
    
    
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ulkeler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucreadi", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row). \(ulkeler[indexPath.row])"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Seçilen Ülkeler \(ulkeler[indexPath.row])")
    }
    
  
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            print("Seçilen Ülkeler \(ulkeler[indexPath.row])")
        }
    }
 
}


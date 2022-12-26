//
//  ViewController.swift
//  MultibleTableView
//
//  Created by haci.simsek on 26.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableviewUlkeler: UITableView!
    
    @IBOutlet weak var tableViewSehirler: UITableView!
    
    var ulkeler:[String] = [String]()
    var sehirler:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye","Almanya","Japonya","Rusya"]
        sehirler = ["Ankara", "Berlin", "Moskov", "Tokyo"]
        
        tableviewUlkeler.delegate = self
        tableviewUlkeler.dataSource = self
        
        tableViewSehirler.delegate = self
        tableViewSehirler.dataSource = self
    }

}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var veriSayisi:Int?
        
        if tableView == tableviewUlkeler {
            veriSayisi = ulkeler.count
        }
        
        if tableView == tableViewSehirler{
            veriSayisi = sehirler.count
        }
        
        return veriSayisi!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        
        if tableView == tableviewUlkeler {
            cell = tableView.dequeueReusableCell(withIdentifier: "ulkelerHucre", for: indexPath)
            cell?.textLabel?.text = ulkeler[indexPath.row]
        }
        
        if tableView == tableViewSehirler{
            cell = tableView.dequeueReusableCell(withIdentifier: "sehirlerHucre", for: indexPath)
            cell?.textLabel?.text = sehirler[indexPath.row]
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableviewUlkeler {
            print("seçilen ülke: \(ulkeler[indexPath.row])")
        }
        
        if tableView == tableViewSehirler{
            print("seçilen sehir : \(sehirler[indexPath.row])")
        }
    }
}

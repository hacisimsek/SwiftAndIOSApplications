//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by haci.simsek on 2.03.2023.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListe = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        searchBar.delegate = self
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            
        }
        
        if segue.identifier == "toGuncelle"{
            
        }
    }
    func tumKisilerAl() {
        do {
            kisilerListe =  try context.fetch(Kisiler.fetchRequest())
        } catch {
            print("dneeme ")
        }
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisiHucre", for: indexPath) as! KisiHucreTableViewCell
        cell.kisiYaziLabel.text = kisi.kisi_ad
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let silAction = UITableViewRowAction(style: .default, title: "Sil", handler: {(action:UITableViewRowAction, indexPath:IndexPath) -> Void in
            print("Sil tıklandı \(self.kisilerListe[indexPath.row])")
            
        })
        let guncelleAction = UITableViewRowAction(style: .normal, title: "Güncelle", handler: {(action:UITableViewRowAction, indexPath:IndexPath) -> Void in
            print("Güncelle tıklandı \(self.kisilerListe[indexPath.row])")
            self.performSegue(withIdentifier: "toGuncelle", sender: indexPath.row)
        })
        
        return [silAction,guncelleAction]
    }
}

extension ViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}


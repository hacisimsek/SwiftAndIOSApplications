//
//  ViewController.swift
//  AlisverisSepeti
//
//  Created by Hacı Şimşek on 5.02.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    var isimDizisi = [String]()
    var idDizisi = [UUID]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(eklemeButonuEklendi))
        
        verileriAl()
    }
    
    func verileriAl(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
        
        do{
            let sonuclar = try context.fetch(fetchRequest)
            
            for sonuc in sonuclar as! [NSManagedObject]{
                if let isimler = sonuc.value(forKey: "isim") as? String {
                    isimDizisi.append(isimler)
                }
                
                if let id = sonuc.value(forKey: "id") as? UUID {
                    idDizisi.append(id)
                }
                
            }
            tableView.reloadData()
        }catch{
            print("hata var")
            
        }
    }

    @objc func eklemeButonuEklendi(){
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isimDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = isimDizisi[indexPath.row]
        return cell
    }
    
}


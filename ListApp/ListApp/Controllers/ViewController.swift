//
//  ViewController.swift
//  ListApp
//
//  Created by Hacı Şimşek on 27.02.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var alertController = UIAlertController()
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
       fetch()

    }
    
    @IBAction func didDeletBarButtonItemTapped(_ sender : UIBarButtonItem){
        presentAlert(title: "Uyarı!", message: "Listedeki bütün itemleri silmek istediğinizden emin misiniz?", cancelButtontitle: "Vazgeç", defaultButtonTitle: "Evet") { _ in
            self.data.removeAll()
            self.tableView.reloadData()
        }
    }
    
    @IBAction func didAddBarButtonItemTapped(_ sender: UIBarButtonItem){
        presentAlert(title: "Yeni eleman ekle", message: nil, cancelButtontitle: "Vazgeç",isTextFieldAvailable: true, defaultButtonTitle: "Ekle", defaultButtonHandeler: { _ in
            let text = self.alertController.textFields?.first?.text
            if text != "" {
                //                self.data.append((text)!)
                let appDelegate = UIApplication.shared.delegate as?  AppDelegate
                let managedObjectContext = appDelegate?.persistentContainer.viewContext
                
                let entity = NSEntityDescription.entity(forEntityName: "ListItem", in: managedObjectContext!)
                
                let listItem = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
                listItem.setValue(text, forKey: "title")
                try? managedObjectContext?.save()
                self.fetch()
            }else{
                self.presentAlert(title: "Uyarı!", message: "Liste elemanı boş olmaz", cancelButtontitle: "Tamam")
            }
        })
    }
    
    func presentAlert(title: String? , message:String? , preferrenStyle: UIAlertController.Style = .alert , cancelButtontitle: String?, isTextFieldAvailable: Bool = false, defaultButtonTitle: String? = nil, defaultButtonHandeler: ((UIAlertAction) -> Void)? = nil){
        
        alertController = UIAlertController(title: title, message: message, preferredStyle: preferrenStyle )
        
        if defaultButtonTitle != nil {
            let defaultButton = UIAlertAction(title: defaultButtonTitle, style: .default, handler: defaultButtonHandeler)
            alertController.addAction(defaultButton)
        }
        
        let cancelButton = UIAlertAction(title: cancelButtontitle, style: .cancel)
        
        if isTextFieldAvailable {
            alertController.addTextField()
        }
        
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
        
    }
    
    func fetch( ) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedObjectContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ListItem")
        data = try! managedObjectContext! .fetch(fetchRequest)
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        let listItem = data[indexPath.row]
        cell.textLabel?.text = listItem.value(forKey: "title") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Sil") { _, _, _ in
//            self.data.remove(at: indexPath.row)
            let appDelegate = UIApplication.shared.delegate as?  AppDelegate
            let managedObjectContext = appDelegate?.persistentContainer.viewContext
            managedObjectContext?.delete(self.data[indexPath.row])
            try? managedObjectContext?.save()
            self.fetch()
        }
        
        deleteAction.backgroundColor = .systemRed
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
            self.presentAlert(title: "Edit", message: nil, cancelButtontitle: "Vazgeç",isTextFieldAvailable: true, defaultButtonTitle: "Düzenle", defaultButtonHandeler: { _ in
                let text = self.alertController.textFields?.first?.text
                if text != "" {
                    //                    self.data[indexPath.row] = text!
                    let appDelegate = UIApplication.shared.delegate as?  AppDelegate
                    let managedObjectContext = appDelegate?.persistentContainer.viewContext
                    self.data[indexPath.row].setValue(text, forKey: "title")
                    
                    if managedObjectContext!.hasChanges{
                        try?  managedObjectContext?.save()
                    }
                    
                    self.tableView.reloadData()
                }else{
                    self.presentAlert(title: "Uyarı!", message: "Liste elemanı boş olmaz", cancelButtontitle: "Tamam")
                }
            })
        }
        editAction.backgroundColor = .systemOrange
        let config = UISwipeActionsConfiguration(actions: [editAction])
        return config
    }
}

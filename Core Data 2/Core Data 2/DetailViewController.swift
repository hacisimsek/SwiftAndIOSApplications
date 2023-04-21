//
//  DetailViewController.swift
//  Core Data 2
//
//  Created by haci.simsek on 21.04.2023.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    //Mark: -Variables
    @IBOutlet weak var infoLbl: UILabel!
    var context :NSManagedObjectContext?
    
    //Mark: -Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitViews()
        
    }
    
    private func setInitViews(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        do{
            let result = try context!.fetch(request)
            for data in result {
                let name = (data as AnyObject).value(forKey: "name") as! String
                let age = (data as AnyObject).value(forKey: "age") as! Int32
                let id = (data as AnyObject).value(forKey: "id") as! Int16
                
                let text = infoLbl.text!
                infoLbl.text = "\(text) name:\(name), age:\(age),  id:\(id)\n"
                print(data)
            }
        } catch {
            print("Can not release the data")
        }
    }
}

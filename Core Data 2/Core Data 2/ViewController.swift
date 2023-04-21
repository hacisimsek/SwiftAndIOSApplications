//
//  ViewController.swift
//  Core Data 2
//
//  Created by haci.simsek on 21.04.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    //Mark: -Variables
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    var newStudent: NSManagedObject?
    var context :NSManagedObjectContext?
    
    //Mark: -Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitViews()
    }
    
    private func setInitViews(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Student", in: context!)
        
        newStudent = NSManagedObject(entity: entity!, insertInto: context)
    }

    @IBAction func saveButton(_ sender: UIButton) {
        saveData()
    }
    
    private func saveData(){
        if let name = nameText.text, let age = ageText.text {
            newStudent!.setValue(name, forKey: "name")
            newStudent!.setValue(Int32(age), forKey: "age")
            let randomInt16 = Int16.random(in: Int16.min...Int16.max)
            newStudent!.setValue(Int16(randomInt16), forKey: "id")
            
            do{
                try context?.save()
                goToNextScreen()
            } catch {
                print("Can not Save")
            }
        } else {
            print("Fields empty")
        }
    }
    
    private func goToNextScreen(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


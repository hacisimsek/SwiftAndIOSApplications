//
//  ViewController.swift
//  SuperKahramanKitabi
//
//  Created by Hacı Şimşek on 30.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var characterNameTable: UITableView!
    var superKahramanGorselleriIsimleri = [String]()
    var superKahramanName = [String]()
    
    var secilenIsim = ""
    var secilenImage = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        characterNameTable.delegate = self
        characterNameTable.dataSource = self
        
        superKahramanName.append("Batman")
        superKahramanName.append("Superman")
        superKahramanName.append("Ironman")
        superKahramanName.append("Spiderman")
        superKahramanName.append("Captain America")
        
        //var superKahramanImage = [UIImage]()
        //superKahramanImage.append(UIImage(named: "batman")!)
        superKahramanGorselleriIsimleri.append("batman")
        superKahramanGorselleriIsimleri.append("superman")
        superKahramanGorselleriIsimleri.append("iron-man")
        superKahramanGorselleriIsimleri.append("spiderman")
        superKahramanGorselleriIsimleri.append("captan-america")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superKahramanName.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superKahramanName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            superKahramanGorselleriIsimleri.remove(at: indexPath.row)
            superKahramanName.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenIsim = superKahramanName[indexPath.row]
        secilenImage = superKahramanGorselleriIsimleri[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenKahramanIsmi = secilenIsim
            destinationVC.secilenKahramanImage = secilenImage
        }
    }
}


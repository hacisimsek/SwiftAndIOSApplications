//
//  ViewController.swift
//  CustomCellTable
//
//  Created by haci.simsek on 27.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var KisilerTableView: UITableView!
    
    var kisilerListe = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KisilerTableView.dataSource = self
        KisilerTableView.delegate = self
        
        let k1 = Kisiler(kisiId: 1, kisiAd: "ahmet", kisiTel: "123455")
        let k2 = Kisiler(kisiId: 2, kisiAd: "mehmet", kisiTel: "123455")
        let k3 = Kisiler(kisiId: 3, kisiAd: "zeynep", kisiTel: "123455")
        let k4 = Kisiler(kisiId: 4, kisiAd: "can", kisiTel: "123455")
        let k5 = Kisiler(kisiId: 5, kisiAd: "ece", kisiTel: "123455")
        let k6 = Kisiler(kisiId: 6, kisiAd: "kemal", kisiTel: "123455")
        
        kisilerListe.append(k1)
        kisilerListe.append(k2)
        kisilerListe.append(k3)
        kisilerListe.append(k4)
        kisilerListe.append(k5)
        kisilerListe.append(k6)

    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource,TableViewHucreProtocol {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gelenKisi = kisilerListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre", for: indexPath) as! TableViewHucre
        cell.kisiAdLabel.text = gelenKisi.kisiAd
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gelenKisi = kisilerListe[indexPath.row]
        print("Id: \(gelenKisi.kisiId!) adı: \(gelenKisi.kisiAd!)")
    }
    
    func hucreUzerindeButtonTiklandi(indexPath: IndexPath) {
        print("\(kisilerListe[indexPath.row].kisiAd!)")
    }
}

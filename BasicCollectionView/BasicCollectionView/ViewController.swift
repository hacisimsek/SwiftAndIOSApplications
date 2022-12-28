//
//  ViewController.swift
//  BasicCollectionView
//
//  Created by haci.simsek on 28.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let screen = UIScreen.main.bounds
    
    var ulkeler:[String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tasarim:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//
//        let genislik = self.collectionView.frame.size.width
//
//        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//
//        tasarim.itemSize = CGSize(width: (genislik-30)/3, height: (genislik-30)/3)
//
//        tasarim.minimumInteritemSpacing = 5
//
//        tasarim.minimumLineSpacing = 5
        
        ulkeler = ["Türkiye","Almanya","Japonya","Rusya","İtalya","Fransa","Mısır"]
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ulkeler.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ulkeHucre", for: indexPath) as! CollectionViewHucre
        cell.hucreLable.text = ulkeler[indexPath.row]
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Ulke Adı : \(ulkeler[indexPath.row])")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.screen.width / 4) + 22, height: (self.screen.width / 4) + 20 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}

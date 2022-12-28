//
//  ViewController.swift
//  DetailCollectionView
//
//  Created by haci.simsek on 28.12.2022.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var filmlerListesi = [Filmler]()
    
    let screen = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate=self
        collectionView.dataSource=self
        
        let f1 = Filmler(filmId: 1, filmBaslik: "Django", filmResimAdi: "django", filmfiyat: 15.99)
        let f2 = Filmler(filmId: 2, filmBaslik: "inception", filmResimAdi: "inception", filmfiyat: 14.99)
        let f3 = Filmler(filmId: 3, filmBaslik: "interstellar", filmResimAdi: "interstellar", filmfiyat: 13.99)
        let f4 = Filmler(filmId: 4, filmBaslik: "thehatefuleight", filmResimAdi: "thehatefuleight", filmfiyat: 12.99)
        let f5 = Filmler(filmId: 5, filmBaslik: "thepianist", filmResimAdi: "thepianist", filmfiyat: 11.99)
        
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        
    }
}

extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! FilmHucre
        cell.filmAdiLabel.text = film.filmBaslik!
        cell.filmFiyatLabel.text = "\(film.filmfiyat!) TL"
        cell.filmImageView.image = UIImage(named: film.filmResimAdi!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(filmlerListesi[indexPath.row].filmBaslik!)")
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//           return CGSize(width: (self.screen.width / 2) , height: (self.screen.width / 2)  )
//       }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//           return UIEdgeInsets(top: 5, left: 35, bottom: 5, right: 35)
//       }
}

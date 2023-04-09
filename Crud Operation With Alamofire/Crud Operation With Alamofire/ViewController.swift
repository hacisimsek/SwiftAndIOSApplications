//
//  ViewController.swift
//  Crud Operation With Alamofire
//
//  Created by haci.simsek on 9.04.2023.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    /* MARK: PROPERTEİS */
    @IBOutlet weak var productTableView: UITableView!
    var artist = [ArtistResults]()
    let imageCache = AutoPurgingImageCache(memoryCapacity: UInt64(100000).megabytes(), preferredMemoryUsageAfterPurge: UInt64(90000).megabytes())
    let refreshControl = UIRefreshControl()
    /* MARK: FUNCTİONS */
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitViews()
        loadJsonData()
    }
    
    private func setInitViews(){
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    @objc private func refreshData(){
        self.artist = []
        self.productTableView.reloadData()
        loadJsonData()
        self.refreshControl.endRefreshing()
    }
    private func loadJsonData(){
        AF.request("https://itunes.apple.com/search?media=music&term=bollywood")
            .response { response in
                let json = try? JSONDecoder().decode(Artist.self, from: response.data!)
                self.artist = json?.results ?? []
                
                for i in json?.results ?? []{
                    AF.request(i.artworkUrl60).responseImage { response in
                        
                        if response.data != nil {
                            let image = UIImage(data: response.data!, scale: 1.0)
                            self.imageCache.add(image!, for: URLRequest(url: URL(string: i.artworkUrl60)!))
                            DispatchQueue.main.async {
                                self.productTableView.reloadData()
                            }
                        }
                    }
                }
                
            }
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artist.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as! ProductTableViewCell
        if artist.count > 0 {
            let artistData = artist[indexPath.row]
            cell.artistImgView.image = imageCache.image(for: URLRequest(url: URL(string: artistData.artworkUrl60)!))
            cell.trackNameLbl.text = artistData.trackName
            cell.artistNameLbl.text = artistData.artistName
            cell.artistLbl.text = artistData.country
        }
        return cell
    }
}
extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}


//
//  YemekTableViewCell.swift
//  DetailTableViewCell
//
//  Created by haci.simsek on 27.12.2022.
//

import UIKit

protocol YemekTableViewCellProtocol {
    func siparisVer(indexPath:IndexPath)
}

class YemekTableViewCell: UITableViewCell {

    @IBOutlet weak var yemekResmiImageView: UIImageView!
    
    @IBOutlet weak var yemekAdiLabel: UILabel!
    
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    var hucreProtocol:YemekTableViewCellProtocol?
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func siparisVer(_ sender: Any) {
        hucreProtocol?.siparisVer(indexPath: indexPath!)
    }
}

//
//  TableViewHucre.swift
//  CustomCellTable
//
//  Created by haci.simsek on 27.12.2022.
//

import UIKit

protocol TableViewHucreProtocol {
    func hucreUzerindeButtonTiklandi(indexPath:IndexPath)
}

class TableViewHucre: UITableViewCell {

    @IBOutlet weak var kisiAdLabel: UILabel!
    
    var hucreProtocol:TableViewHucreProtocol?
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonTikla(_ sender: Any) {
        hucreProtocol?.hucreUzerindeButtonTiklandi(indexPath: indexPath!)
    }
    
}

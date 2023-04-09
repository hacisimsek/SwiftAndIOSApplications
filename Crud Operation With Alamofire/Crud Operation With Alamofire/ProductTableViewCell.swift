//
//  ProductTableViewCell.swift
//  Crud Operation With Alamofire
//
//  Created by haci.simsek on 9.04.2023.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    /* MARK: PROPERTEİS */
    
    @IBOutlet weak var artistImgView: UIImageView!
    @IBOutlet weak var trackNameLbl: UILabel!
    @IBOutlet weak var artistNameLbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    
    /* MARK: FUNCTİONS */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

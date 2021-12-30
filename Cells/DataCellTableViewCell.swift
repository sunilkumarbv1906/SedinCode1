//
//  DataCellTableViewCell.swift
//  SedinApp
//
//  Created by Deepak on 29/12/21.
//

import UIKit

class DataCellTableViewCell: UITableViewCell {

    @IBOutlet weak var sedinUserImage: UIImageView!
    @IBOutlet weak var sedinUserLabel: UILabel!
    @IBOutlet weak var sedinLoginName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

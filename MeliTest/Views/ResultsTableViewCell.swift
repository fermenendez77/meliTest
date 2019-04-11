//
//  ResultsTableViewCell.swift
//  MeliTest
//
//  Created by Fernando Menendez on 06/04/2019.
//  Copyright © 2019 Fernando Menendez. All rights reserved.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
    
    public static let STORYBOARD_ID = "resultsTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var freeShippingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

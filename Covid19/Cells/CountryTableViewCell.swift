//
//  CountryTableViewCell.swift
//  Covid19
//
//  Created by DonorRaja on 21/04/20.
//  Copyright © 2020 DonorRaja. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var totalCases: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    //MARK: - Variables
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.addSubview(flagImageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

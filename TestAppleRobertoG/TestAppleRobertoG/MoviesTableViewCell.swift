//
//  MoviesTableViewCell.swift
//  TestAppleRobertoG
//
//  Created by Dragon on 01/08/19.
//  Copyright © 2019 Roberto Gonzalez C. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var labelCell: UILabel!
    
    @IBOutlet weak var lenguageLabelCell: UILabel!
    
    @IBOutlet weak var ratingLabelCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    //PREPARE FOR REUSE CELL
    override func prepareForReuse() {
        super.prepareForReuse()
        imageCell?.image = nil
        labelCell.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

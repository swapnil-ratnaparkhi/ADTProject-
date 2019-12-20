//
//  TableViewCell.swift
//  ADTProject
//
//  Created by Swapnil Ratnaparkhi on 12/19/19.
//  Copyright © 2019 Swapnil Ratnaparkhi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var authorDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

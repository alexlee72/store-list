//
//  StoreCell.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-26.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit

class StoreCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }

}

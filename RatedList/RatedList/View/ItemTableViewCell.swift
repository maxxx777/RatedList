//
//  ItemTableViewCell.swift
//  RatedList
//
//  Created by MAXIM TSVETKOV on 20.11.18.
//  Copyright © 2018 MAXIM TSVETKOV. All rights reserved.
//

import UIKit
import Cosmos

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingView: CosmosView?
    
    var viewModel: ItemCellViewModel? {
        didSet {
            self.textLabel?.text = viewModel?.title            
            self.ratingView?.rating = Double(viewModel?.ratingValue ?? 0)
        }
    }
}

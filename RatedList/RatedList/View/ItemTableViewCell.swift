//
//  ItemTableViewCell.swift
//  RatedList
//
//  Created by MAXIM TSVETKOV on 20.11.18.
//  Copyright © 2018 MAXIM TSVETKOV. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    var viewModel: ItemCellViewModel? {
        didSet {
            self.textLabel?.text = viewModel?.title
        }
    }
}

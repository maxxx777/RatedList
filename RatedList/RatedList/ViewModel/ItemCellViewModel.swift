//
//  ItemCellViewModel.swift
//  RatedList
//
//  Created by MAXIM TSVETKOV on 20.11.18.
//  Copyright © 2018 MAXIM TSVETKOV. All rights reserved.
//

import Foundation

protocol ItemCellViewModel {
    
    var title: String {get}
}

struct ItemCellViewModelImp {
    
    private let item: Item
    
    init(item: Item) {
        self.item = item
    }
}

extension ItemCellViewModelImp: ItemCellViewModel {
    
    var title: String {
        return item.name
    }
}

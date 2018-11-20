//
//  Item.swift
//  RatedList
//
//  Created by MAXIM TSVETKOV on 20.11.18.
//  Copyright © 2018 MAXIM TSVETKOV. All rights reserved.
//

import Foundation

struct Item: Decodable {
    
    let itemId: Int
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case itemId
        case name
    }
}

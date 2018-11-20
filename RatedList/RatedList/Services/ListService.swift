//
//  ListService.swift
//  RatedList
//
//  Created by MAXIM TSVETKOV on 20.11.18.
//  Copyright © 2018 MAXIM TSVETKOV. All rights reserved.
//

import Foundation

typealias FetchItemsResult = ([Item]?) -> Void

protocol ListService {

    func fetchItems(with completion: @escaping FetchItemsResult)
}

struct ListServiceImp: ListService {
    
    func fetchItems(with completion: @escaping FetchItemsResult) {
        
        guard let path = Bundle.main.path(forResource: "list", ofType: "json") else { return completion(nil) }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let items = try decoder.decode([Item].self, from: data)
            return completion(items)
        } catch {
            return completion(nil)
        }        
    }
}

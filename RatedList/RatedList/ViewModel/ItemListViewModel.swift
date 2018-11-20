//
//  ItemListViewModel.swift
//  RatedList
//
//  Created by MAXIM TSVETKOV on 20.11.18.
//  Copyright © 2018 MAXIM TSVETKOV. All rights reserved.
//

import Foundation

protocol ItemListViewModel {
    
    func fetchItems(with completion: @escaping (Bool) -> Void)
}

struct ItemListViewModelImp: ItemListViewModel {
    
    private let listService: ListService
    
    init(listService: ListService) {
        
        self.listService = listService
    }
    
    func fetchItems(with completion: @escaping (Bool) -> Void) {
        
        listService.fetchItems { (items) in
            
            guard let _ = items else {
                
                DispatchQueue.main.async {
                    completion(false)
                }
                
                return
            }
            
            DispatchQueue.main.async {
                completion(true)
            }
        }
    }
}

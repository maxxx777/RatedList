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
    func numberOfItems() -> Int
    func cellViewModel(at index: Int) -> ItemCellViewModel?
    func update(ratingValue: Int, at index: Int, with completion: @escaping (Int) -> Void)
}

class ItemListViewModelImp {
    
    private let listService: ListService
    private var cellViewModels: [ItemCellViewModelImp] = []
    
    init(listService: ListService) {
        
        self.listService = listService
    }
}

extension ItemListViewModelImp: ItemListViewModel {
    
    func fetchItems(with completion: @escaping (Bool) -> Void) {
        
        listService.fetchItems { [weak self] (items) in
            
            guard let items = items else {
                
                DispatchQueue.main.async {
                    completion(false)
                }
                
                return
            }
            
            self?.cellViewModels = items.map {
                ItemCellViewModelImp(item: $0)
            }
            
            DispatchQueue.main.async {
                completion(true)
            }
        }
    }
    
    func numberOfItems() -> Int {
        
        return cellViewModels.count
    }
    
    func cellViewModel(at index: Int) -> ItemCellViewModel? {
        
        return cellViewModels[index]
    }
    
    func update(ratingValue: Int,
                at index: Int,
                with completion: @escaping (Int) -> Void) {
        
        var cellViewModel = cellViewModels.remove(at: index)
        
        var newIndex = cellViewModels.firstIndex { $0.rating < ratingValue }
        newIndex = newIndex ?? index
        
        cellViewModel.rating = ratingValue
        cellViewModels.insert(cellViewModel, at: newIndex!)
        
        completion(newIndex!)
    }
}

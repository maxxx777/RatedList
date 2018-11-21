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
    func update(ratingValue: Int, for itemId:Int, with completion: @escaping (Int?) -> Void)
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
                for itemId: Int,
                with completion: @escaping (Int?) -> Void) {
        
        let currentIndex = cellViewModels.lastIndex { (cellViewModel) -> Bool in
            return cellViewModel.item.itemId == itemId
        }
        
        guard let _ = currentIndex else {
            completion(nil)
            return
        }
        
        var newIndex = cellViewModels.lastIndex { (cellViewModel) -> Bool in
            return cellViewModel.rating < ratingValue
        }
        
        newIndex = newIndex ?? 0
        
        var cellViewModel = cellViewModels.remove(at: currentIndex!)
        cellViewModel.rating = ratingValue
        cellViewModels.insert(cellViewModel, at: newIndex!)
        
        completion(newIndex)
    }
}

//
//  AppFactory.swift
//  RatedList
//
//  Created by MAXIM TSVETKOV on 20.11.18.
//  Copyright © 2018 MAXIM TSVETKOV. All rights reserved.
//

import UIKit

class AppFactory {
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func itemListViewController() -> ItemListViewController {
        
        let listService = ListServiceImp()
        let viewModel = ItemListViewModelImp(listService: listService)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        
        viewController.viewModel = viewModel
        
        return viewController
    }
}


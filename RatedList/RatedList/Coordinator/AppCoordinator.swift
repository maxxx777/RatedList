//
//  AppCoordinator.swift
//  RatedList
//
//  Created by MAXIM TSVETKOV on 20.11.18.
//  Copyright © 2018 MAXIM TSVETKOV. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    private let navigationController = UINavigationController()
    private let factory = AppFactory()
    
    init(window: UIWindow?) {
        
        window?.rootViewController = navigationController
    }
    
    func start() {
        
        let viewController = factory.itemListViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}


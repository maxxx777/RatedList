//
//  ViewController.swift
//  RatedList
//
//  Created by MAXIM TSVETKOV on 20.11.18.
//  Copyright © 2018 MAXIM TSVETKOV. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {

    //dependencies
    var viewModel: ItemListViewModel!
    
    //IBOutlets
    @IBOutlet weak var tableView: UITableView?
    
    //Constants
    fileprivate let CellReuseIdentifier = "CellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        fetchItems()
    }
}

fileprivate extension ItemListViewController {
    
    func configureView() {
        
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    func fetchItems() {
        
        viewModel.fetchItems { [weak self] result in
            guard result else {
                //TODO: show error message
                return
            }
            
            self?.updateView()
        }
    }
    
    func updateView() {
        
        tableView?.reloadData()
    }
}

extension ItemListViewController: UITableViewDelegate {
 
}

extension ItemListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier, for: indexPath) as! ItemTableViewCell
        
        let cellViewModel = viewModel.cellViewModel(at: indexPath.item)
        
        cell.viewModel = cellViewModel
        
        return cell
    }
}

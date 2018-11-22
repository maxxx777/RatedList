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
    
    func reorderItems(between index1: Int, and index2: Int) {
        var indexPaths:[IndexPath] = []
        if index1 > index2 {
            indexPaths = (index2...index1).map{ IndexPath(row: $0, section: 0) }
        } else if index1 < index2 {
            indexPaths = (index1...index2).map{ IndexPath(row: $0, section: 0) }
        } else {
            indexPaths = [IndexPath(row: index1, section: 0)]
        }        
        tableView?.reloadRows(at: indexPaths, with: .automatic)        
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

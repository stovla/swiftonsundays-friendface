//
//  ViewController.swift
//  Friendface
//
//  Created by Vlastimir Radojevic on 1/29/19.
//  Copyright © 2019 Vlastimir Radojevic. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating {
    let dataSource = FriendDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.dataChanged = { [weak self] in
            self?.tableView.reloadData()
        }
        
        dataSource.fetch("https://www.hackingwithswift.com/samples/friendface.json")
        tableView.dataSource = dataSource
        
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false // true is best for a separate controller that shows the result of the search
        search.searchBar.placeholder = "Find a friend"
        search.searchResultsUpdater = self
        navigationItem.searchController = search
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        dataSource.filterText = searchController.searchBar.text
    }
}


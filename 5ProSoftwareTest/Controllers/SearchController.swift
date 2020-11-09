//
//  SearchController.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 06.11.2020.
//

import UIKit


class SearchController: UITableViewController, UISearchBarDelegate {
    
    
    var viewModel: SearchViewModel?
    
    let searchController = UISearchController(searchResultsController: nil)
  
    let cellId = "cellId"
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel()

        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(SearchTableCell.self, forCellReuseIdentifier: cellId)
        setupSearchBar()
    }
    
    
    
    //MARK:- Search Bar Setup and filtering

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        viewModel?.search(term: searchText, completion: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel?.clear()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    fileprivate func setupSearchBar() {
        searchController.searchBar.delegate = self
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
    }

    //MARK:- UITableView DataSource
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? SearchTableCell
        guard let tableCell = cell, let viewModel = viewModel else {return UITableViewCell()}

        let cellViewModel = viewModel.toCellViewModel(at: indexPath)
        tableCell.viewModel = cellViewModel

        return tableCell
    }
    
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {return}
        viewModel.selectRow(at: indexPath)
        
        let controller = DetailController()
        controller.viewModel = viewModel.viewModelForSelectedRow()
       
        self.showDetailViewController(UINavigationController(rootViewController: controller), sender: nil)
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {return 0}
        if viewModel.recipes.count == 0 {
                self.tableView.setEmptyMessage()
            } else {
                self.tableView.restore()
            }
        return viewModel.numberOfRows()
    
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.width / 5
    }
 
    
    
}

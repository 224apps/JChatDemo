//
//  PeopleTableViewController.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/19/20.
//

import UIKit

class PeopleTableViewController: UITableViewController, UISearchResultsUpdating{
    
    var users: [User] = []
    var searchController : UISearchController  = UISearchController(searchResultsController: nil)
    var searchResults: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBarController()
        setupNavigationBar()
        ObserveUsers()
    }
    
    func setupSearchBarController(){
        searchController.searchResultsUpdater  = self
        searchController.searchBar.placeholder = "Search users"
        searchController.searchBar.barTintColor =  UIColor.white
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    func setupNavigationBar(){
        navigationItem.title = "People"
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    func  ObserveUsers(){
        API.User.observeUsers { (user) in
            self.users.append(user)
            self.tableView.reloadData()
        }
    }
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text == nil || searchController.searchBar.text!.isEmpty {
            view.endEditing(true)
        }else{
            let textLowercased = searchController.searchBar.text!.lowercased()
            filterContent(for: textLowercased)
        }
    }
    
    func filterContent(for searchText: String){
        searchResults = self.users.filter {
            return $0.username.lowercased().range(of: searchText) != nil
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchController.isActive ? searchResults.count : self.users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_CELL_PEOPLE, for: indexPath) as! UserTableViewCell
        let user = searchController.isActive ? searchResults[indexPath.row] : self.users[indexPath.row]
        cell.loadData(user)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
}

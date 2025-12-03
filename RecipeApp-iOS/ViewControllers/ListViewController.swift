//
//  ViewController.swift
//  RecipeApp-iOS
//
//  Created by Mananas on 3/12/25.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    var recipes: [Recipe] = []
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        findRecipesByName(query: "")
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    // MARK: Buisness Logic
    
    func findRecipesByName(query: String) {
        Task {
            recipes = await RecipeProvider.findRecipesByName(query: query)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: TableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Recipe Cell", for: indexPath) as! RecipeViewCell
        let recipe = recipes[indexPath.row]
        cell.render(with: recipe)
        return cell
    }
    
    // MARK: SearchBar Delegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        findRecipesByName(query: searchBar.text ?? "")
    }
    
    /*func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            findRecipesByName(query: "")
        }
    }*/
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        findRecipesByName(query: "")
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let recipe = recipes[indexPath.row]
        detailViewController.recipe = recipe
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


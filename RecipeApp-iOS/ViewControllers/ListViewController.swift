//
//  ViewController.swift
//  RecipeApp-iOS
//
//  Created by Mananas on 3/12/25.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipes: [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        findRecipesByName(query: "")
    }
    
    func findRecipesByName(query: String) {
        Task {
            recipes = await RecipeProvider.findRecipesByName(query: query)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Recipe Cell", for: indexPath) as! RecipeViewCell
        let recipe = recipes[indexPath.row]
        cell.render(with: recipe)
        return cell
    }
}


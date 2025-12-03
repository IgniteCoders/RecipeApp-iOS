//
//  DetailViewController.swift
//  RecipeApp-iOS
//
//  Created by Mananas on 3/12/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var dificultyLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    var recipe: Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = recipe.name
        nameLabel.text = recipe.name
        ingredientsLabel.text = recipe.ingredients.map { " - \($0)" }.joined(separator: "\n")
        instructionsLabel.text = recipe.instructions.map { " - \($0)" }.joined(separator: "\n")
        timeLabel.text = "\(recipe.prepTimeMinutes + recipe.cookTimeMinutes) min"
        servingsLabel.text = "\(recipe.servings) servings"
        dificultyLabel.text = recipe.difficulty.uppercased()
        recipeImageView.loadFrom(url: recipe.image)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

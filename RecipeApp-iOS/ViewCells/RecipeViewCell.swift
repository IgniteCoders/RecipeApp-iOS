//
//  RecipeViewCell.swift
//  RecipeApp-iOS
//
//  Created by Mananas on 3/12/25.
//

import UIKit

class RecipeViewCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func render(with recipe: Recipe) {
        nameLabel.text = recipe.name
        recipeImageView.loadFrom(url: recipe.image)
    }
}

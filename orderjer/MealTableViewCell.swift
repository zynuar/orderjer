//
//  MealTableViewCell.swift
//  orderjer
//
//  Created by Izzaty on 18/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealPriceLabel: UILabel!
    @IBOutlet weak var addMealButton: UIButton!
    
    func setMeals(meal: Meals){
        mealImageView.image = meal.image
        mealNameLabel.text = meal.name
        mealPriceLabel.text = meal.price
    }
    
}

//
//  MealViewController.swift
//  orderjer
//
//  Created by Izzaty on 19/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class MealViewController: UIViewController {

    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var singleMealImageView: UIImageView!
    @IBOutlet weak var selectedMealNameLabel: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    
    var selectedMeal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedMealNameLabel.text = "\((selectedMeal?.mealName)!)"
        singleMealImageView.image = selectedMeal?.mealImage
        imageBackground.roundCorners(.topLeft, radius: 50)
        placeOrderButton.layer.cornerRadius = 8
        placeOrderButton.layer.borderWidth = 2.5
        placeOrderButton.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func dismissTapped(_ sender: UIButton) {
          dismiss(animated: true, completion: nil)
    }
    
}

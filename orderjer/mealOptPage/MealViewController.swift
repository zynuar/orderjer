//
//  MealViewController.swift
//  orderjer
//
//  Created by Izzaty on 19/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class MealViewController: UIViewController {
   
    @IBOutlet weak var mealOptionsTableView: UITableView!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var singleMealImageView: UIImageView!
    @IBOutlet weak var selectedMealNameLabel: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    var selectedMeal: Meal?
    var selectedRows = [String:IndexPath]()
    let sections = ["Options","Drinks"]
    // initialize empty array
    var optMeals: [OptMeal] = []
    var optDrinks: [OptDrinks] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedMealNameLabel.text = "\((selectedMeal?.mealName)!)"
        singleMealImageView.image = selectedMeal?.mealImage

        imageBackground.roundCorners(.topLeft, radius: 50)
        placeOrderButton.layer.cornerRadius = 8
        placeOrderButton.layer.borderWidth = 2.5
        placeOrderButton.layer.borderColor = UIColor.white.cgColor
        
        optMeals = createOptMealArray()
        optDrinks = createOptDrinkArray()
    }
    
    func createOptMealArray() -> [OptMeal] {
        var tempMeals: [OptMeal] = []
        if selectedMeal?.mealName == "Snack Plate" {
            let meal1 = OptMeal(optName: "Single Meal", optPrice: 10.00, type: "Meal")
            let meal2 = OptMeal(optName: "Regular Meal", optPrice: 12.00, type: "Meal")
            let meal3 = OptMeal(optName: "Ala Carte", optPrice: 6.00, type: "Meal")

            tempMeals.append(meal1)
            tempMeals.append(meal2)
            tempMeals.append(meal3)

        } else if selectedMeal?.mealName == "Dinner Plate" {
            
            let meal1 = OptMeal(optName: "Single Meal", optPrice: 10.00, type: "Meal")
            let meal2 = OptMeal(optName: "Regular Meal", optPrice: 12.00, type: "Meal")
            let meal3 = OptMeal(optName: "Ala Carte", optPrice: 6.00, type: "Meal")
           
            tempMeals.append(meal1)
            tempMeals.append(meal2)
            tempMeals.append(meal3)
 
        } else if selectedMeal?.mealName == "tealive" {
            
            let meal1 = OptMeal(optName: "Single Meal", optPrice: 10.00, type: "Meal")
            let meal2 = OptMeal(optName: "Regular Meal", optPrice: 12.00, type: "Meal")
            let meal3 = OptMeal(optName: "Ala Carte", optPrice: 6.00, type: "Meal")

            tempMeals.append(meal1)
            tempMeals.append(meal2)
            tempMeals.append(meal3)

            
        }
        return tempMeals
    }
    
    func createOptDrinkArray() -> [OptDrinks] {
        var tempMeals: [OptDrinks] = []
        if selectedMeal?.mealName == "Snack Plate" {
            
            let meal1 = OptDrinks(optDrinksName: "Coca-Cola", optDrinksPrice: 0.00, type: "Drinks")
            let meal2 = OptDrinks(optDrinksName: "Mountain Dew", optDrinksPrice: 0.00, type: "Drinks")
            let meal3 = OptDrinks(optDrinksName: "Ice Lemon Tea", optDrinksPrice: 1.80, type: "Drinks")
          
            tempMeals.append(meal1)
            tempMeals.append(meal2)
            tempMeals.append(meal3)
            
        } else if selectedMeal?.mealName == "Dinner Plate" {
            
            let meal1 = OptDrinks(optDrinksName: "Coca-Cola", optDrinksPrice: 0.00, type: "Drinks")
            let meal2 = OptDrinks(optDrinksName: "Mountain Dew", optDrinksPrice: 0.00, type: "Drinks")
            let meal3 = OptDrinks(optDrinksName: "Ice Lemon Tea", optDrinksPrice: 1.80, type: "Drinks")
            
            tempMeals.append(meal1)
            tempMeals.append(meal2)
            tempMeals.append(meal3)
        
        } else if selectedMeal?.mealName == "tealive" {
            
            let meal1 = OptDrinks(optDrinksName: "Coca-Cola", optDrinksPrice: 0.00, type: "Drinks")
            let meal2 = OptDrinks(optDrinksName: "Mountain Dew", optDrinksPrice: 0.00, type: "Drinks")
            let meal3 = OptDrinks(optDrinksName: "Ice Lemon Tea", optDrinksPrice: 1.80, type: "Drinks")
            tempMeals.append(meal1)
            tempMeals.append(meal2)
            tempMeals.append(meal3)
        }
        return tempMeals
    }
    
    @IBAction func dismissTapped(_ sender: UIButton) {
          dismiss(animated: true, completion: nil)
    }
    
}

extension MealViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let counts: Int
        if section == 0 {
            counts = optMeals.count
        } else {
            counts = optDrinks.count
        }

        return counts
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }

// MealOptCell
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }
    }

    func addSelectedCellWithSection(_ indexPath:IndexPath) -> IndexPath? {
        let existingIndexPath = selectedRows["\(indexPath.section)"]
        selectedRows["\(indexPath.section)"] = indexPath

        return existingIndexPath
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealOptCell") as! MealOptionsTableViewCell
        if indexPath.section == 0 {
            let meal = optMeals[indexPath.row]
            
            cell.setOptMeals(meal: meal)
        } else {
            let drink = optDrinks[indexPath.row]
            cell.setOptDrinks(drink: drink)
        }
        return cell
    }


}


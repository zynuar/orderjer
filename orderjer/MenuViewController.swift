//
//  MenuViewController.swift
//  orderjer
//
//  Created by Izzaty on 18/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var mealTableView: UITableView!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var shopsNameLabel: UILabel!
    var mealName = ""
    var meals: [Meals] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meals = createArray()
        mealTableView.register(MealTableViewCell.self, forCellReuseIdentifier: "MealTableViewCell")
        imageBackground.roundCorners(.topLeft, radius: 50)
        shopsNameLabel.text = mealName
        if mealName == "kfc" {
            menuImage.image = UIImage(named: "cover menu kfc")
        } else if mealName == "mcd" {
            menuImage.image = UIImage(named: "cover menu mcd")
        } else if mealName == "tealive" {
            menuImage.image = UIImage(named: "cover menu tealive")
        }
    }
    
    func createArray() -> [Meals] {
        var tempMeals: [Meals] = []
        
        if mealName == "kfc" {
            let photo1 = UIImage(named: "snack plate")!
            let meal1 = Meals(name: "Snack Plate", image: photo1, price: "RM 10.00")
            let photo2 = UIImage(named: "dinner plate")!
            let meal2 = Meals(name: "Dinner Plate", image: photo2, price: "RM 15.00")
            let photo3 = UIImage(named: "family feast")!
            let meal3 = Meals(name: "Family Feast", image: photo3, price: "RM 53.00")
            
            tempMeals.append(meal1)
            tempMeals.append(meal2)
            tempMeals.append(meal3)
            
        } else if mealName == "mcd" {
            menuImage.image = UIImage(named: "cover menu mcd")
        } else if mealName == "tealive" {
            menuImage.image = UIImage(named: "cover menu tealive")
        }
        
        return tempMeals
    }
    
    
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mealTableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as! MealTableViewCell
        
        let meal = meals[indexPath.row]
        cell.setMeals(meal: meal)
        return cell
    }
}

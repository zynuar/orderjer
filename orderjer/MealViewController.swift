//
//  MealViewController.swift
//  orderjer
//
//  Created by Izzaty on 19/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class MealViewController: UIViewController {
   var names = ["Vegetables": ["Tomato", "Potato", "Lettuce"], "Fruits": ["Apple", "Banana"]]

    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var singleMealImageView: UIImageView!
    @IBOutlet weak var selectedMealNameLabel: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!

    var selectedMeal: Meal?
    
    struct DetailsOfMeal {
        var sectionName: String!
        var sectionOpt: [String]!
    }
    var arrayOfOptions = [DetailsOfMeal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedMealNameLabel.text = "\((selectedMeal?.mealName)!)"
        singleMealImageView.image = selectedMeal?.mealImage
        imageBackground.roundCorners(.topLeft, radius: 50)
        placeOrderButton.layer.cornerRadius = 8
        placeOrderButton.layer.borderWidth = 2.5
        placeOrderButton.layer.borderColor = UIColor.white.cgColor
        
        for (key, value) in names {
            print("\(key) -> \(value)")
            arrayOfOptions.append(DetailsOfMeal(sectionName: key, sectionOpt: value))
        }
    }
    
    @IBAction func dismissTapped(_ sender: UIButton) {
          dismiss(animated: true, completion: nil)
    }
    
}

extension MealViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfOptions[section].sectionOpt.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealOptionsTableViewCell", for: indexPath) as! MealOptionsTableViewCell
        
        // Configure the cell...
        cell.variationsLabel?.text = arrayOfOptions[indexPath.section].sectionOpt[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayOfOptions[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            singleMealImageView.image = UIImage(named: "selected")!
            cell.accessoryView = singleMealImageView
           // cell.accessoryType = .checkmark
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            singleMealImageView.image = UIImage(named: "unselect")!
            cell.accessoryView = singleMealImageView
           // cell.accessoryType = .none
        }
    }
}

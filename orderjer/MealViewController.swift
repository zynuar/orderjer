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
    let sections = ["Options","Drinks"]
    let items = [
        ["Single Meal", "Double Meal", "Ala Carte"],
        ["Coca-Cola", "Pepsi", "Mountain Dew", "Iced Lemon Tea"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealOptionsTableView.delegate = self
        mealOptionsTableView.dataSource = self
        mealOptionsTableView.reloadData()
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

extension MealViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealViewController", for: indexPath)
        cell.textLabel?.text = items[indexPath.section][indexPath.row]
        return cell
        
    }
    
    
}


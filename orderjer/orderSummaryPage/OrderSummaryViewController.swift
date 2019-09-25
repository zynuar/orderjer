//
//  OrderSummaryViewController.swift
//  orderjer
//
//  Created by Izzaty on 20/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class OrderSummaryViewController: UIViewController {
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var serviceTaxLabel: UILabel!
    @IBOutlet weak var orderFeeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var mealsName = ""
    var getMeals: [SelectedMeals] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedButton.layer.cornerRadius = 8
        createArray()
        print(getMeals)
    }
    
    private func createArray() {
        let meal1 = SelectedMeals(selectedMealName: "Double Cheese Burger", selectedOptions: "Regular Meal", selectedDrinks: "Coca Cola" , selectedMealPrice: 10.00, selectedMealQuantity: 2)
        let meal2 = SelectedMeals(selectedMealName: "Ayam Goreng Mcd", selectedOptions: "Small Meal", selectedDrinks: "Ice Lemon Tea", selectedMealPrice: 12.00, selectedMealQuantity: 1)
        let meal3 = SelectedMeals(selectedMealName: "Double Quarter Pounder", selectedOptions: "Ala Carte", selectedDrinks: "", selectedMealPrice: 8.00, selectedMealQuantity: 1)
        getMeals += [meal1, meal2, meal3]
    }
    
    @IBAction func dismissTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension OrderSummaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getMeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = getMeals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderSummaryTableViewCell") as! OrderSummaryTableViewCell
        cell.layer.cornerRadius = 16.0
        cell.selectedMealNameLabel.text = meal.selectedMealName
        cell.selectedOptionLabel.text = meal.selectedOptions
        cell.selectedDrinkLabel.text = meal.selectedDrinks
        cell.selectedMealPrice.text = "RM \(meal.selectedMealPrice)"
        cell.selectedMealQuantity.text = meal.selectedDrinks
        return cell
    }
}

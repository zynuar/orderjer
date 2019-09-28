//
//  MealViewController.swift
//  orderjer
//
//  Created by Izzaty on 19/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

//struct MenuOpt {
//    var mealName: String
//    var options : [[optList]]
//    var drinks : [[drinksList]]
//}

struct optList {
    var optName: String
    var optPrice: Double
}

struct drinksList {
    var drinkName: String
    var drinkPrice: Double
}

class MealViewController: UIViewController {
   
    @IBOutlet weak var mealOptionsTableView: UITableView!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var singleMealImageView: UIImageView!
    @IBOutlet weak var selectedMealNameLabel: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    var selectedMeal: Meal?
    var selectedRows = [String:IndexPath]()
//     var arrayOfArray = [MenuOpt]()
    let sections = ["Options","Drinks"]
    var items = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        mealOptionsTableView.delegate = self
//        mealOptionsTableView.dataSource = self
 
        selectedMealNameLabel.text = "\((selectedMeal?.mealName)!)"
        singleMealImageView.image = selectedMeal?.mealImage
    
        imageBackground.roundCorners(.topLeft, radius: 50)
        placeOrderButton.layer.cornerRadius = 8
        placeOrderButton.layer.borderWidth = 2.5
        placeOrderButton.layer.borderColor = UIColor.white.cgColor
        let opt = [ [optList(optName: "Single Meal", optPrice: 10.00)],
                    [optList(optName: "Double Meal", optPrice: 12.00)],
                    [optList(optName: "Ala Carte", optPrice: 6.00)] ]
        let drink = [[drinksList(drinkName: "Coca-cola", drinkPrice: 0.00)],
                     [drinksList(drinkName: "Mountain Dew", drinkPrice: 0.00)],
                     [drinksList(drinkName: "Milo", drinkPrice: 1.60)]]
        items.append(opt)
        items.append(drink)
//        print(items)
       
        if selectedMeal?.mealName == "kfc"{
//            let kfc = MenuOpt(mealName: "kfc",
//                              options: [[optList(optName: "Single Meal", optPrice: 10.00)],
//                                        [optList(optName: "Double Meal", optPrice: 12.00)],
//                                        [optList(optName: "Ala Carte", optPrice: 6.00)]],
//                              drinks: [[drinksList(drinkName: "Coca-cola", drinkPrice: 0.00)],
//                                       [drinksList(drinkName: "Mountain Dew", drinkPrice: 0.00)],
//                                       [drinksList(drinkName: "Milo", drinkPrice: 1.60)]])
//            arrayOfArray.append(kfc)
          let opt = [ [optList(optName: "Single Meal", optPrice: 10.00)],
                     [optList(optName: "Double Meal", optPrice: 12.00)],
                     [optList(optName: "Ala Carte", optPrice: 6.00)] ]
            let drink = [[drinksList(drinkName: "Coca-cola", drinkPrice: 0.00)],
                         [drinksList(drinkName: "Mountain Dew", drinkPrice: 0.00)],
                         [drinksList(drinkName: "Milo", drinkPrice: 1.60)]]
            items.append(opt)
            items.append(drink)
            print(items)
        } else if selectedMeal?.mealName == "mcd" {
//            let mcd = MenuOpt(mealName: "mcd",
//                              options: [optList(optName: "Single Meal", optPrice: 10.00),
//                                        optList(optName: "Double Meal", optPrice: 12.00),
//                                        optList(optName: "Ala Carte", optPrice: 6.00)],
//                              drinks: [drinksList(drinkName: "Coca-cola", drinkPrice: 0.00),
//                                       drinksList(drinkName: "Mountain Dew", drinkPrice: 0.00),
//                                       drinksList(drinkName: "Milo", drinkPrice: 1.60),
//                                       drinksList(drinkName: "Iced Lemon Tea", drinkPrice: 1.60)])
//            arrayOfArray.append(mcd)
        }
    }
    
    @IBAction func dismissTapped(_ sender: UIButton) {
          dismiss(animated: true, completion: nil)
    }
    
}

//extension MealViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sections[section]
//    }
////
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return items[section].count
////    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
//        }
//    }
//
//// MealOptCell
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
//        }
//    }
//
//    func addSelectedCellWithSection(_ indexPath:IndexPath) -> IndexPath? {
//        let existingIndexPath = selectedRows["\(indexPath.section)"]
//        selectedRows["\(indexPath.section)"] = indexPath
//
//        return existingIndexPath
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MealOptCell", for: indexPath)
////        cell.textLabel?.text = items[indexPath.section][indexPath.row]
////        if indexPath.section == 0 {
////            cell.textLabel?.text = arrayOfArray[section].options[section][row].optName
////            cell.detailTextLabel?.text = "+ RM \(arrayOfArray[section].options[section][row].optPrice)"
////        } else {
////            cell.textLabel?.text = arrayOfArray[section].drinks[section][row].drinkName
////            cell.detailTextLabel?.text = "+ RM \(arrayOfArray[section].drinks[section][row].drinkPrice)"
////        }
//        return cell
//    }
//
//
//}


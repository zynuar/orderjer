//
//  Meal.swift
//  orderjer
//
//  Created by Izzaty on 19/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class Meal {
    
    var mealImage: UIImage?
    var mealName: String
   var mainCourse: [Any]
    
    init(mealImage: UIImage, mealName: String, mainCourse: [Any]) {
        self.mealImage = mealImage
        self.mealName = mealName
        self.mainCourse = mainCourse
    }
}

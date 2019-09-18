//
//  System.swift
//  orderjer
//
//  Created by Izzaty on 17/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

struct System {
    static func clearNavigationBar(forBar navBar: UINavigationBar){
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
}

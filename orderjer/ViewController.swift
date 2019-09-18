//
//  ViewController.swift
//  orderjer
//
//  Created by PPAS RATU SIX on 14/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var searchLocation: UITextField! {
        didSet{
            searchLocation.tintColor = UIColor.black
            searchLocation.setIcon(UIImage(named: "searchBig")!)
        }
    }
    @IBOutlet weak var carouselView: UICollectionView!
    @IBOutlet weak var shopsView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var begin = false
    var images = [UIImage(named: "kfc"), UIImage(named: "mcd"), UIImage(named: "tealive")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageControl.numberOfPages = images.count
        self.carouselView.delegate = self
        self.carouselView.dataSource = self
        self.shopsView.delegate = self
        self.shopsView.dataSource = self
        if let navController = navigationController {
            System.clearNavigationBar(forBar: navController.navigationBar)
            navController.view.backgroundColor = .clear
        }
        searchLocation.layer.cornerRadius = 24.0
        searchLocation.layer.shadowOffset = CGSize(width: 0, height: 3)
        searchLocation.layer.shadowColor = UIColor.black.cgColor
        searchLocation.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        searchLocation.layer.shadowOpacity = 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.carouselView {
            return images.count
        } else {
            return images.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.carouselView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            cell.carouselImgView.image = images[indexPath.row]
            return cell
        } else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopsCollectionViewCell", for: indexPath) as! ShopsCollectionViewCell
            cell2.shopsViewImage.image = images[indexPath.row]
            return cell2
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       let width = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / width
        let roundedIndex = round(index)
        self.pageControl?.currentPage = Int(roundedIndex)
    }

}


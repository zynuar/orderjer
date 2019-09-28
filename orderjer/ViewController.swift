//
//  ViewController.swift
//  orderjer
//
//  Created by PPAS RATU SIX on 14/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate, NVActivityIndicatorViewable {
    
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
    var x = 1
    let carouselImages = ["kfc","mcd","tealive"]
    let mallImages = ["kfc mall","mcd mall","tealive mall"]
    
    override func viewDidLoad() {
        if let navController = navigationController {
            System.clearNavigationBar(forBar: navController.navigationBar)
            navController.view.backgroundColor = .clear
        }
        let size = CGSize(width: 30, height: 30)
        startAnimating(size, message: "Loading...", type: .pacman, fadeInAnimation: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.stopAnimating(nil)
        }
        super.viewDidLoad()
        self.pageControl.numberOfPages = carouselImages.count
        self.carouselView.delegate = self
        self.carouselView.dataSource = self
        self.shopsView.delegate = self
        self.shopsView.dataSource = self
        searchLocation.delegate = self
        self.startTimer()
        searchLocation.layer.cornerRadius = 24.0
        searchLocation.layer.shadowOffset = CGSize(width: 0, height: 3)
        searchLocation.layer.shadowColor = UIColor.black.cgColor
        searchLocation.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        searchLocation.layer.shadowOpacity = 2
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        performSegue(withIdentifier: "toSearchPage", sender: nil)
        return false
    }
    
    func startTimer() {
        let _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }
    
    @objc func scrollAutomatically(){
       self.pageControl.currentPage = x
        if self.x < carouselImages.count {
            let indexPath = IndexPath(item: x, section: 0)
            self.carouselView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.x = self.x + 1
        } else {
            self.x = 0
            self.carouselView.scrollToItem(at: IndexPath(item: x, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.carouselView {
            return carouselImages.count
        } else {
            return mallImages.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.carouselView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            cell.carouselImgView.image = UIImage(named: carouselImages[indexPath.row])
            return cell
        } else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopsCollectionViewCell", for: indexPath) as! ShopsCollectionViewCell
            cell2.shopsViewImage.image = UIImage(named: mallImages[indexPath.row])
            return cell2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.shopsView {
            let vc = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
            vc?.shopsName = mallImages[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       let width = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / width
        let roundedIndex = round(index)
        self.pageControl?.currentPage = Int(roundedIndex)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if (context.nextFocusedItem != nil){
            carouselView.scrollToItem(at: context.nextFocusedItem as! IndexPath, at: .centeredHorizontally, animated: true)
        }
    }

}


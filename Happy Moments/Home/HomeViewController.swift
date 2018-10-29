//
//  HomeViewController.swift
//  Happy Moments
//
//  Created by Sandeep Kumar  Yaramchitti on 10/21/18.
//  Copyright © 2018 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        let layerGradient = CAGradientLayer()
        layerGradient.colors = [Colors.logoRedColor.cgColor, Colors.logoBlueColor.cgColor]
        layerGradient.startPoint = CGPoint(x: 1, y: 0.5)
        layerGradient.endPoint = CGPoint(x: 0.5, y: 1)
        layerGradient.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        // self.tabBar.layer.addSublayer(layerGradient)
        self.collectionView?.layer.addSublayer(layerGradient)
        // collectionView?.backgroundColor = UIColor.white
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
   
}

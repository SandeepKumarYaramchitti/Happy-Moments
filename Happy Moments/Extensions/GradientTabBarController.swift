//
//  GradientTabBarController.swift
//  Happy Moments
//
//  Created by Sandeep Kumar  Yaramchitti on 10/27/18.
//  Copyright © 2018 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit

class GradientTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUPGradientTabBar()
        
    }
    
    func setUPGradientTabBar() {
        let layerGradient = CAGradientLayer()
        layerGradient.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        layerGradient.startPoint = CGPoint(x: 0, y: 0.5)
        layerGradient.endPoint = CGPoint(x: 1, y: 0.5)
        layerGradient.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        self.tabBar.layer.addSublayer(layerGradient)
    }
}

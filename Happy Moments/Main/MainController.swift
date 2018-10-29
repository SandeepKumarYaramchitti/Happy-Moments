//
//  MainController.swift
//  Happy Moments
//
//  Created by Sandeep Kumar  Yaramchitti on 10/7/18.
//  Copyright © 2018 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MainController:  UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.delegate = self
        //Gradient Style Later
//        let layerGradient = CAGradientLayer()
//        layerGradient.colors = [Colors.logoRedColor.cgColor, Colors.logoBlueColor.cgColor]
//        layerGradient.startPoint = CGPoint(x: 0, y: 0.5)
//        layerGradient.endPoint = CGPoint(x: 1, y: 0.5)
//        layerGradient.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
//        self.tabBar.layer.addSublayer(layerGradient)
        
//        UITabBar.appearance().barTintColor = UIColor.black
//        tabBar.isTranslucent = false
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                print("Current User is logged in:")
                let signUpController = VideoPlayerController()
                let navController = UINavigationController(rootViewController: signUpController)
                self.present(navController, animated: true, completion: nil)
            }
//            return
        }
        
        print("Executing the Navigation Controller.....")
        setUpNavigationControllers()
        
    }
    

    
    func setUpNavigationControllers() {
        
        self.transParentTabBar()
        //New Feeds Controller
        let newFeedViewController = temlateNavContorller(unselectedImage: #imageLiteral(resourceName: "MySpace-UnSelected").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "MySpace-Selected").withRenderingMode(.alwaysOriginal), titleName: "MySpace", unselectedColor: Colors.unselectedColor, selectedColor: Colors.selectedTabBarColor, rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        let exploreViewController = temlateNavContorller(unselectedImage: #imageLiteral(resourceName: "Explore-Unselected").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "Explore-Selected").withRenderingMode(.alwaysOriginal), titleName: "Explore", unselectedColor: Colors.unselectedColor, selectedColor: Colors.selectedTabBarColor, rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        let addPhotoViewController = temlateNavContorller(unselectedImage: #imageLiteral(resourceName: "Add-Photo-Selected").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "Add-Photo-Selected").withRenderingMode(.alwaysOriginal), titleName: "SharePhoto", unselectedColor: Colors.redPhotoColor, selectedColor: Colors.redPhotoColor, rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        let notificationViewController = temlateNavContorller(unselectedImage: #imageLiteral(resourceName: "Notification-Unselected").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "Notification-Selected").withRenderingMode(.alwaysOriginal), titleName: "Notification", unselectedColor: Colors.unselectedColor, selectedColor: Colors.selectedTabBarColor, rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        let userPofileViewController = temlateNavContorller(unselectedImage: #imageLiteral(resourceName: "User-Unselected").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "User-Selected").withRenderingMode(.alwaysOriginal), titleName: "User", unselectedColor: Colors.unselectedColor, selectedColor: Colors.selectedTabBarColor, rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        viewControllers = [newFeedViewController, exploreViewController, addPhotoViewController, notificationViewController, userPofileViewController]
        guard let items = tabBar.items else {return}
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
        
    }
    
    fileprivate func temlateNavContorller(unselectedImage: UIImage?, selectedImage: UIImage, titleName: String, unselectedColor: UIColor?, selectedColor: UIColor?,rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let ProfileViewController = rootViewController
        let NavViewContorller = UINavigationController(rootViewController: ProfileViewController)
        self.tabBar.unselectedItemTintColor = unselectedColor
        NavViewContorller.tabBarItem.image = unselectedImage
        NavViewContorller.tabBarItem.selectedImage = selectedImage
        NavViewContorller.tabBarItem.title = titleName
        self.tabBar.tintColor = selectedColor
        return NavViewContorller
    }
    
    fileprivate func transParentTabBar() {
        let transperentBlackColor = UIColor(displayP3Red: 225, green: 225, blue: 225, alpha: 1)
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        transperentBlackColor.setFill()
        UIRectFill(rect)
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            tabBar.backgroundImage = image
        }
        UIGraphicsEndImageContext()
    }
    

    
}


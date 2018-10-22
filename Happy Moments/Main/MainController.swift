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
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                print("Current User is logged in:")
                let signUpController = VideoPlayerController()
                let navController = UINavigationController(rootViewController: signUpController)
                self.present(navController, animated: true, completion: nil)
            }
            return
        }
        
        setUpNavigationControllers()
        
    }
    
    func setUpNavigationControllers() {
        
        //Home Profile Controller
        let homeProfileViewController = temlateNavContorller(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        let searchProfileViewController = temlateNavContorller(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        let photoSelectionContorller = temlateNavContorller(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        let layout = UICollectionViewFlowLayout()
        let userProfileViewController = HomeViewController(collectionViewLayout: layout)
        let userProfileNavController = UINavigationController(rootViewController: userProfileViewController)
        userProfileNavController.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        userProfileNavController.tabBarItem.title = "user"
        tabBar.tintColor = UIColor.red
        viewControllers = [homeProfileViewController, searchProfileViewController, photoSelectionContorller, userProfileNavController]
        guard let items = tabBar.items else {return}
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: -3, right: 0)
        }
        
    }
    
    fileprivate func temlateNavContorller(unselectedImage: UIImage?, selectedImage: UIImage,
                                          rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let ProfileViewController = rootViewController
        let NavViewContorller = UINavigationController(rootViewController: ProfileViewController)
        NavViewContorller.tabBarItem.image = unselectedImage
        NavViewContorller.tabBarItem.title = "Home"
//        NavViewContorller.tabBarItem.selectedImage = selectedImage
//        NavViewContorller.tabBarItem.title = "Homes"
        return NavViewContorller
    }
}

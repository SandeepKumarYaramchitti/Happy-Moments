//
//  MainController.swift
//  Happy Moments
//
//  Created by Sandeep Kumar  Yaramchitti on 10/7/18.
//  Copyright © 2018 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import Foundation
import UIKit

class MainController: UIViewController {
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpViewControllers()
        setDummyViewController()
        
    }
    
    fileprivate func setUpViewControllers() {
        
        DispatchQueue.main.async {
            let signUpController = VideoPlayerController()
            let navController = UINavigationController(rootViewController: signUpController)
            self.present(navController, animated: true, completion: nil)
            
        }
    }
    
    func setDummyViewController() {
        DispatchQueue.main.async {
            let loginController = LoginController()
            let navController = UINavigationController(rootViewController: loginController)
            self.present(navController, animated: true, completion: nil)
            
        }
    }
}

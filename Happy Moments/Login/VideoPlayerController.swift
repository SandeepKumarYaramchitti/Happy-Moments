//
// VideoPlayerController.swift
//  Happy Moments
//
//  Created by Sandeep Kumar  Yaramchitti on 10/7/18.
//  Copyright © 2018 Sandeep Kumar  Yaramchitti. All rights reserved.
//


import UIKit
import AVFoundation
import AVKit

class VideoPlayerController: UIViewController {
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    let videoView: UIView = {
        let view = UIView()
        return view
    }()
    
    let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.rgb(red: 242, green: 242, blue: 242, alpha: 1)
        button.layer.cornerRadius = 24
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        button.titleLabel?.textColor = UIColor.white
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc fileprivate func handleSignUp() {
        print("Handling Sign up Button....")
        DispatchQueue.main.async {
            let signUpController = SignupController()
            let navController = UINavigationController(rootViewController: signUpController)
            self.present(navController, animated: true, completion: nil)
        }
    }
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.rgb(red: 0, green: 122, blue: 204, alpha: 1)
        button.layer.cornerRadius = 24
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        button.titleLabel?.textColor = UIColor.black
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    @objc fileprivate func handleLogin() {
        print("Handle Log in....")
        DispatchQueue.main.async {
            let loginController = LoginController()
            let navController = UINavigationController(rootViewController: loginController)
            self.present(navController, animated: true, completion: nil)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.addSubview(videoView)
        _ = videoView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        setUpViews()
        
    }
    fileprivate func setUpViews() {
        configureVideoPlayer()
        setUpInputFields()
        
    }
    
    fileprivate func setUpInputFields() {
        videoView.addSubview(signupButton)
        videoView.addSubview(loginButton)
        _ = signupButton.anchor(videoView.centerYAnchor, left: videoView.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 100, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        _ = loginButton.anchor(signupButton.bottomAnchor, left: videoView.leftAnchor, bottom: nil, right: videoView.rightAnchor, topConstant: 20, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
    }
    
    
    fileprivate func configureVideoPlayer() {
        guard let url = Bundle.main.url(forResource:"newVideo", withExtension: "mov") else {return}
        player = AVPlayer.init(url: url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerLayer?.frame = view.layer.frame
        player?.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        player?.isMuted = true
        playVideo()
        setupPlayNotificationItems()
    }
    
    private func setupPlayNotificationItems() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(restartPlayerItem),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: player?.currentItem)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playVideo),
                                               name: .UIApplicationWillEnterForeground,
                                               object: nil)
    }
    
    @objc private func playVideo() {
        restartPlayerItem()
        player?.play()
        if let playerlayer = playerLayer {
            view.layer.insertSublayer(playerlayer, at: 0)
        }
    }
    @objc func restartPlayerItem() {
        player?.seek(to: kCMTimeZero)
    }
}

//
//  RootViewController.swift
//  NavigationControllerAnimations
//
//  Created by Josh Kaden on 2/5/15.
//  Copyright (c) 2015 Hopscotch Technologies, Inc. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    private let navigationControllerDelegate = RootNavigationControllerDelegate()
    private let playButton: UIButton = UIButton.buttonWithType(.System) as UIButton
    private let createButton: UIButton = UIButton.buttonWithType(.System) as UIButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Root View Controller"
        
        self.navigationController?.delegate = self.navigationControllerDelegate
        
        self.playButton.addTarget(self, action: "playButtonWasTapped", forControlEvents: .TouchUpInside)
        self.playButton.setTitle("Play", forState: .Normal)
        self.view.addSubview(self.playButton)
        
        self.createButton.addTarget(self, action: "createButtonWasTapped", forControlEvents: .TouchUpInside)
        self.createButton.setTitle("Create", forState: .Normal)
        self.view.addSubview(self.createButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.playButton.frame = CGRect(x: 0, y: 100, width: self.view.bounds.size.width, height: 100)
        self.createButton.frame = CGRect(x: 0, y: 200, width: self.view.bounds.size.width, height: 100)
    }
    
    func playButtonWasTapped() {
        let viewController = PlayViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func createButtonWasTapped() {
        let viewController = CreateViewController()
        self.navigationController?.setTransitionType(.Fade)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

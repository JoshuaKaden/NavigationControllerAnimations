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
    private let titleLabel = UILabel()
    private let standardButton = UIButton()
    private let fadeButton = UIButton()
    private let fromBottomButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        self.title = "Root View Controller"
        
        self.navigationController?.delegate = self.navigationControllerDelegate
        self.navigationController?.navigationBarHidden = true
        
        self.setupControls()
    }
    
    private func setupControls() {
        self.titleLabel.textAlignment = .Center
        self.titleLabel.text = self.title
        self.view.addSubview(self.titleLabel)
        
        self.standardButton.addTarget(self, action: "standardButtonWasTapped", forControlEvents: .TouchUpInside)
        self.standardButton.setTitle("Standard", forState: .Normal)
        self.view.addSubview(self.standardButton)
        
        self.fadeButton.addTarget(self, action: "fadeButtonWasTapped", forControlEvents: .TouchUpInside)
        self.fadeButton.setTitle("Fade", forState: .Normal)
        self.view.addSubview(self.fadeButton)
        
        self.fromBottomButton.addTarget(self, action: "fromBottomButtonWasTapped", forControlEvents: .TouchUpInside)
        self.fromBottomButton.setTitle("From Bottom", forState: .Normal)
        self.view.addSubview(self.fromBottomButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.titleLabel.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 100)
        self.standardButton.frame = CGRect(x: 0, y: 100, width: self.view.bounds.size.width, height: 100)
        self.fadeButton.frame = CGRect(x: 0, y: 200, width: self.view.bounds.size.width, height: 100)
        self.fromBottomButton.frame = CGRect(x: 0, y: 300, width: self.view.bounds.size.width, height: 100)
    }
    
    func standardButtonWasTapped() {
        self.pushWithTransition(.Standard)
    }
    
    func fadeButtonWasTapped() {
        self.pushWithTransition(.Fade)
    }
    
    func fromBottomButtonWasTapped() {
        self.pushWithTransition(.FromBottom)
    }
    
    private func pushWithTransition(transitionType: HSTransitionType) {
        let viewController = AlphaViewController()
        self.navigationController?.setTransitionType(transitionType)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

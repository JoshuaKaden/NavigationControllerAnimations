//
//  AlphaViewController.swift
//  NavigationControllerAnimations
//
//  Created by Josh Kaden on 2/5/15.
//  Copyright (c) 2015 Hopscotch Technologies, Inc. All rights reserved.
//

import UIKit

class AlphaViewController: UIViewController {

    private let titleLabel = UILabel()
    private let standardButton: UIButton = UIButton.buttonWithType(.System) as UIButton
    private let fadeButton: UIButton = UIButton.buttonWithType(.System) as UIButton
    private let fromBottomButton: UIButton = UIButton.buttonWithType(.System) as UIButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        self.title = "Alpha View Controller"
        
        self.setupControls()
    }
    
    private func setupControls() {
        self.titleLabel.textAlignment = .Center
        self.titleLabel.text = self.title
        self.view.addSubview(self.titleLabel)
        
        self.standardButton.addTarget(self, action: "standardButtonWasTapped", forControlEvents: .TouchUpInside)
        self.standardButton.setTitle("Standard back", forState: .Normal)
        self.view.addSubview(self.standardButton)
        
        self.fadeButton.addTarget(self, action: "fadeButtonWasTapped", forControlEvents: .TouchUpInside)
        self.fadeButton.setTitle("Fade back", forState: .Normal)
        self.view.addSubview(self.fadeButton)
        
        self.fromBottomButton.addTarget(self, action: "fromBottomButtonWasTapped", forControlEvents: .TouchUpInside)
        self.fromBottomButton.setTitle("From Bottom back", forState: .Normal)
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
        self.navigationController?.setTransitionType(.Standard)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func fadeButtonWasTapped() {
        self.navigationController?.setTransitionType(.Fade)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func fromBottomButtonWasTapped() {
        self.navigationController?.setTransitionType(.FromBottom)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}

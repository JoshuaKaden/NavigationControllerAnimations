//
//  RootNavigationControllerDelegate.swift
//  NavigationControllerAnimations
//
//  Created by Josh Kaden on 2/5/15.
//  Copyright (c) 2015 Hopscotch Technologies, Inc. All rights reserved.
//

import UIKit

class RootNavigationControllerDelegate: NSObject, UINavigationControllerDelegate {

    /** Set this if you want a custom animation when Pushing or Popping.
    It will be reset to .Standard after the operation is complete.
    It is more easily set on the UINavigationController itself, via the +Transitions extension. */
    var transitionType: HSTransitionType = .Standard
    

    // MARK: - UINavigationControllerDelegate Methods
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if self.transitionType == .Standard {
            return nil
        }
        let animator = TransitionAnimator(type: self.transitionType, operation: operation)
        self.transitionType = .Standard
        return animator
    }
    
}

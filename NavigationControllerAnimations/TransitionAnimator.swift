//
//  TransitionAnimator.swift
//  NavigationControllerAnimations
//
//  Created by Josh Kaden on 2/5/15.
//  Copyright (c) 2015 Hopscotch Technologies, Inc. All rights reserved.
//

import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var type: HSTransitionType = .Standard
    var operation: UINavigationControllerOperation = .None
    
    class func animatorWithType(type: HSTransitionType, operation: UINavigationControllerOperation) -> TransitionAnimator {
        let animator = self.init()
        animator.type = type
        animator.operation = operation
        return animator
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!.view
        let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!.view
        
        transitionContext.containerView().addSubview(toView)
        
        let completion = {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
        
        if !transitionContext.isAnimated() {
            completion()
            return()
        }
        
        switch self.operation {
        case .Push:
            self.performPushAnimation(toView: toView, completion: completion)
        case .Pop:
            self.performPopAnimation(fromView: fromView, completion: completion)
        default:
            completion()
            return()
        }
    }
    
    private func performPushAnimation(#toView: UIView, completion: () -> ()) {
        var frame = toView.frame
        switch self.type {
        case .Standard:
            frame.origin.x += frame.size.width
        case .Fade:
            toView.alpha = 0
        case .FromBottom:
            frame.origin.y += frame.size.height
        }
        toView.frame = frame
        
        UIView.animateWithDuration(1, animations: {
            
            switch self.type {
            case .Standard:
                frame.origin.x -= frame.size.width
            case .Fade:
                toView.alpha = 1
            case .FromBottom:
                frame.origin.y -= frame.size.height
            }
            toView.frame = frame
            
            }) { (finished: Bool) -> Void in
                completion()
        }
    }
    
    private func performPopAnimation(#fromView: UIView, completion: () -> ()) {
        fromView.superview?.bringSubviewToFront(fromView)
        var frame = fromView.frame
        UIView.animateWithDuration(1, animations: {
            
            switch self.type {
            case .Standard:
                frame.origin.x += frame.size.width
            case .Fade:
                fromView.alpha = 0
            case .FromBottom:
                frame.origin.y += frame.size.height
            }
            fromView.frame = frame
            
            }) { (finished: Bool) -> Void in
                completion()
        }
    }
    
}

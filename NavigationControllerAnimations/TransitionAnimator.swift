//
//  TransitionAnimator.swift
//  NavigationControllerAnimations
//
//  Created by Josh Kaden on 2/5/15.
//  Copyright (c) 2015 Hopscotch Technologies, Inc. All rights reserved.
//

import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let duration: NSTimeInterval = 0.5
    private let type: HSTransitionType
    private let operation: UINavigationControllerOperation
    
    init(type: HSTransitionType, operation: UINavigationControllerOperation) {
        self.type = type
        self.operation = operation
        super.init()
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning Functions
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return self.duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let completion = {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
        
        if !transitionContext.isAnimated() {
            completion()
            return()
        }
        
        let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!.view
        let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!.view
        
        transitionContext.containerView().addSubview(toView)
        
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
    
    // MARK: - Custom Animation Functions
    
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
        
        UIView.animateWithDuration(self.duration, animations: {
            
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
        UIView.animateWithDuration(self.duration, animations: {
            
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

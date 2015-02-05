//
//  UINavigationController+Transitions.swift
//  NavigationControllerAnimations
//
//  Created by Josh Kaden on 2/5/15.
//  Copyright (c) 2015 Hopscotch Technologies, Inc. All rights reserved.
//

import UIKit

enum HSTransitionType {
    case Standard, Fade, FromBottom
}

extension UINavigationController {
    
    func transitionType() -> HSTransitionType {
        if let delegate = self.delegate? as? RootNavigationControllerDelegate {
            return delegate.transitionType
        }
        return .Standard
    }
    
    func setTransitionType(transitionType: HSTransitionType) {
        if let delegate = self.delegate? as? RootNavigationControllerDelegate {
            delegate.transitionType = transitionType
        }
    }
    
}

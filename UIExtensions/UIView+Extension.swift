//
//  UIView+Extension.swift
//  
//
//  Created by Jen Min Chuah on 11/10/18.
//

import Foundation

extension UIView {
    // Fade in a view with a duration
    func fadeIn(duration: TimeInterval = 1.0)  {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.8
        })
    }
    
    // Fade out a view with a duration
    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
    
    // Rotation
    private static let kRotationAnimationKey = "rotationanimationkey"
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: UIView.kRotationAnimationKey)
    }
    
    func stopRotating() {
        if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
        }
    }
    
}

//
//  Extensions.swift
//  j-lingo
//
//  Created by as on 5/30/24.
//

import UIKit

//MARK: - UIView

extension UIView {
    
    func flip360(duration: TimeInterval = 1.0) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        animation.fromValue = 0.0
        animation.toValue = CGFloat.pi * 2.0  // 360 degrees in radians
        animation.duration = duration
        animation.repeatCount = 5
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        layer.add(animation, forKey: nil)
        
    }
    
  func animateToZeroSize(duration: TimeInterval = 1.5, completion: (() -> Void)? = nil) {
        let animation = CABasicAnimation(keyPath: "bounds.size")
        animation.fromValue = NSValue(cgSize: self.frame.size)
        animation.toValue = NSValue(cgSize: CGSize.zero)
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        self.layer.add(animation, forKey: nil)
    }
    
    func fadeIn(duration: TimeInterval = 1.0, completion: (() -> Void)? = nil) {
       if alpha == 1.0 { return } // Skip animation if already fully visible
       alpha = 0.0 // Set initial alpha (assuming it's not already 0)
       UIView.animate(withDuration: duration, animations: {
           self.alpha = 1.0 // Animate alpha to 1.0
           self.showView()
       })
   }

    func fadeOut(duration: TimeInterval = 1.0, completion: (() -> Void)? = nil) {
       if alpha == 0.0 { return } // Skip animation if already hidden
       UIView.animate(withDuration: duration, animations: {
         self.alpha = 0.0 // Animate alpha to 0.0
         self.hideView()
       })
     }
    
     func hideView() {
        self.isHidden = true
    }
    
    fileprivate func showView() {
        self.isHidden = false
    }
    
    func animateConstraintWithSpring(_ constraint: NSLayoutConstraint, to newConstant: CGFloat, duration: TimeInterval, damping: CGFloat, initialSpringVelocity: CGFloat, completion: ((Bool) -> Void)? = nil) {
         // Update the constraint's constant value
         constraint.constant = newConstant
         
         // Animate the layout change with a spring animation
         UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: initialSpringVelocity, options: [], animations: {
             self.layoutIfNeeded()
         }, completion: completion)
     }
 } 
    
   

//MARK: - UILabel

extension UILabel {
    
    func setAngle(_ angle: CGFloat) {
         let angleInRadians = angle * CGFloat.pi / 180.0
         let rotationTransform = CGAffineTransform(rotationAngle: angleInRadians)
         self.transform = rotationTransform
     }
    
    func animateCursiveWriting(initialText: String = "J-Lingo", duration: TimeInterval, completion: @escaping () -> Void) {
        self.text = ""
        let characterArray = Array(initialText)
        var currentIndex = 0
        
        Timer.scheduledTimer(withTimeInterval: duration / Double(initialText.count), repeats: true) { timer in
            guard currentIndex < characterArray.count else {
                timer.invalidate()
                completion()
                return
            }
            self.text?.append(characterArray[currentIndex])
            currentIndex += 1
            
            
        }
        
    }
}



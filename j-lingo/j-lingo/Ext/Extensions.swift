//
//  Extensions.swift
//  j-lingo
//
//  Created by as on 5/30/24.
//

import UIKit
import ImageIO

//MARK: - UIView

extension UIView {
    func loadFromNib(named nibName: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}

extension UIView {
    
    func applyGradient(colors: [CGColor], locations: [NSNumber]? = nil, startPoint: CGPoint = CGPoint(x: 0, y: 0), endPoint: CGPoint = CGPoint(x: 1, y: 1)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = self.bounds
        
        // Remove any previous gradient layers to avoid layering multiple gradients
        self.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func applyVerticalGradient(colors: [CGColor]) {
        applyGradient(colors: colors, startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
    }
    
    func applyHorizontalGradient(colors: [CGColor]) {
        applyGradient(colors: colors, startPoint: CGPoint(x: 0, y: 0.5), endPoint: CGPoint(x: 1, y: 0.5))
    }
}


extension UIView  {
    public func addWaveBackground(to view: UIView){
        let leftDrop:CGFloat = 0.4
        let rightDrop: CGFloat = 0.3
        let leftInflexionX: CGFloat = 0.4
        let leftInflexionY: CGFloat = 0.47
        let rightInflexionX: CGFloat = 0.6
        let rightInflexionY: CGFloat = 0.22

        let backView = UIView(frame: view.frame)
        backView.backgroundColor = .gray
        view.addSubview(backView)
        let backLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x:0, y: view.frame.height * leftDrop))
        path.addCurve(to: CGPoint(x:view.frame.width, y: view.frame.height * rightDrop),
                      controlPoint1: CGPoint(x: view.frame.width * leftInflexionX, y: view.frame.height * leftInflexionY),
                      controlPoint2: CGPoint(x: view.frame.width * rightInflexionX, y: view.frame.height * rightInflexionY))
        path.addLine(to: CGPoint(x:view.frame.width, y: 0))
        path.close()
        backLayer.fillColor = UIColor.blue.cgColor
        backLayer.path = path.cgPath
        backView.layer.addSublayer(backLayer)
     }
}


extension UIView {
    
    func addGradientBorderAnimation(colors: [UIColor], borderWidth: CGFloat = 1.0, duration: CFTimeInterval = 1.0) {
        // Remove any existing gradient border layer
        if let existingBorderLayer = self.layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
            existingBorderLayer.removeFromSuperlayer()
        }
        
        // Create the gradient layer
        let gradientBorderLayer = CAGradientLayer()
        gradientBorderLayer.frame = self.bounds
        gradientBorderLayer.colors = colors.map { $0.cgColor }
        gradientBorderLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientBorderLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientBorderLayer.locations = [0.0, 1.0]
        
        // Create a mask layer to restrict the gradient to the border area
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: self.bounds.insetBy(dx: borderWidth / 2, dy: borderWidth / 2), cornerRadius: self.layer.cornerRadius).cgPath
        maskLayer.fillColor = UIColor.clear.cgColor
        maskLayer.strokeColor = UIColor.black.cgColor
        maskLayer.lineWidth = borderWidth
        maskLayer.lineCap = .round
        
        // Add the mask layer to the gradient layer
        gradientBorderLayer.mask = maskLayer
        
        // Add the gradient border layer to the view
        self.layer.addSublayer(gradientBorderLayer)
        
        // Animate the gradient colors
        let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.fromValue = [UIColor.systemGreen, UIColor.black.cgColor] // Example start colors
        colorAnimation.toValue = colors.map { $0.cgColor }
        colorAnimation.duration = duration
        colorAnimation.repeatCount = .infinity
        
        gradientBorderLayer.add(colorAnimation, forKey: "gradientBorderAnimation")
    }
}

extension UIView{
public func addNeumorphicEffect(cornerRadius: CGFloat = 15.0, themeColor:
                                UIColor = .white) {
    // Remove any existing shadow layers
    self.layer.sublayers?.filter { $0 is CAShapeLayer }.forEach { $0.removeFromSuperlayer() }
    
    // Configure the view's basic properties
    self.layer.cornerRadius = cornerRadius
    self.layer.masksToBounds = false
    
    // Light shadow (for the "inset" effect)
    let lightShadow = CAShapeLayer()
    lightShadow.frame = bounds
    lightShadow.backgroundColor = themeColor.cgColor
    lightShadow.cornerRadius = cornerRadius
    lightShadow.shadowColor = UIColor.white.cgColor
    lightShadow.shadowOffset = CGSize(width: -4.0, height: -4.0)
    lightShadow.shadowOpacity = 0.8
    lightShadow.shadowRadius = 6
    self.layer.insertSublayer(lightShadow, at: 0)
    
    // Dark shadow (for the "lifted" effect)
    let darkShadow = CAShapeLayer()
    darkShadow.frame = bounds
    darkShadow.backgroundColor = themeColor.cgColor
    darkShadow.cornerRadius = cornerRadius
    darkShadow.shadowColor = UIColor(red: 190/255, green: 190/255, blue: 190/255, alpha: 1.0).cgColor
    darkShadow.shadowOffset = CGSize(width: 4.0, height: 4.0)
    darkShadow.shadowOpacity = 0.8
    darkShadow.shadowRadius = 6
    self.layer.insertSublayer(darkShadow, at: 0)
}

}

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


//MARK: - UILabel

extension UILabel {
    
    func flip(duration: TimeInterval = 0.5, completion: ((Bool) -> Void)? = nil) {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromTop, .showHideTransitionViews]

        UIView.transition(with: self, duration: duration, options: transitionOptions, animations: {
            self.isHidden = true
        }, completion: { _ in
            UIView.transition(with: self, duration: duration, options: transitionOptions, animations: {
                self.isHidden = false
            }, completion: completion)
        })
    }
}


extension UILabel {
    
    func swing(duration: TimeInterval = 0.5, completion: ((Bool) -> Void)? = nil) {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
        animation.values = [0, 0.05, -0.05, 0.05, 0]
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.duration = duration
        animation.isAdditive = true
        layer.add(animation, forKey: "swing")
        completion?(true)
    }
}


extension UILabel {
    
    func shake(duration: TimeInterval = 0.5, completion: ((Bool) -> Void)? = nil) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = duration
        animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, 0.0]
        layer.add(animation, forKey: "shake")
        completion?(true)
    }
}


extension UILabel {
    
    func rotateAndScale(duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil) {
        self.transform = CGAffineTransform(rotationAngle: 0).scaledBy(x: 1, y: 1)
        UIView.animate(withDuration: duration, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.transform = CGAffineTransform(rotationAngle: .pi).scaledBy(x: 1.5, y: 1.5)
        }, completion: completion)
    }
}


extension UILabel {
    
    func zoomOut(duration: TimeInterval = 0.5, completion: ((Bool) -> Void)? = nil) {
        self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        UIView.animate(withDuration: duration, animations: {
            self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: completion)
    }
}


extension UILabel {
    
    func zoomIn(duration: TimeInterval = 0.5, completion: ((Bool) -> Void)? = nil) {
        self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        UIView.animate(withDuration: duration, animations: {
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: completion)
    }
}


extension UILabel {
    
    func flash(duration: TimeInterval = 0.5, repeatCount: Float = Float.infinity, completion: ((Bool) -> Void)? = nil) {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = duration
        flash.fromValue = 1.0
        flash.toValue = 0.1
        flash.autoreverses = true
        flash.repeatCount = repeatCount
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        layer.add(flash, forKey: nil)
    }
}


extension UILabel {
    
    func pulsate(duration: TimeInterval = 0.8, repeatCount: Float = Float.infinity, completion: ((Bool) -> Void)? = nil) {
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.duration = duration
        pulse.fromValue = 1.0
        pulse.toValue = 1.1
        pulse.autoreverses = true
        pulse.repeatCount = repeatCount
        pulse.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        layer.add(pulse, forKey: nil)
    }
}


extension UILabel {
    
    // Fade In Animation
    func fadeIn(duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil) {
        self.alpha = 0
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        }, completion: completion)
    }
    
    // Fade Out Animation
    func fadeOut(duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil) {
        self.alpha = 1
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }, completion: completion)
    }
    
    // Slide In from Left
    func slideInFromLeft(duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil) {
        let initialFrame = self.frame
        self.frame = CGRect(x: -self.frame.width, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height)
        UIView.animate(withDuration: duration, animations: {
            self.frame = initialFrame
        }, completion: completion)
    }
    
    // Slide Out to Right
    func slideOutToRight(duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: {
            self.frame = CGRect(x: UIScreen.main.bounds.width, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height)
        }, completion: completion)
    }
    
    // Bounce Animation
    func bounce(duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil) {
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.transform = .identity
        }, completion: completion)
    }
    
    // Rotate Animation
    func rotate(duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        }, completion: { finished in
            UIView.animate(withDuration: duration, animations: {
                self.transform = CGAffineTransform(rotationAngle: .pi * 2)
            }, completion: completion)
        })
    }
}

//MARK: - UIColor

extension UIColor {
    convenience init?(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        guard hexString.count == 6 else {
            return nil
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


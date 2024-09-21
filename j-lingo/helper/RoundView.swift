//
//  RoundView.swift
//  j-lingo
//
//  Created by as on 5/30/24.
//

import UIKit

final class SphereView: UIView {

  override class var layerClass: AnyClass {
    return CAShapeLayer.self
  }

  override func layoutSubviews() {
    super.layoutSubviews()
      
      self.layer.cornerRadius =  self.bounds.height/2
  }

  private func createSpherePath(withRadius radius: CGFloat) -> CGPath {
    let path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: radius, startAngle: 0.0, endAngle: CGFloat.pi * 2.0, clockwise: true)
      
    return path.cgPath
  }
}



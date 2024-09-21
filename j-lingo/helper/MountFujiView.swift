//
//  MountFujiView.swift
//  j-lingo
//
//  Created by as on 6/1/24.
//

import UIKit


import UIKit

class MountFujiView: UIView {
    
    override func draw(_ rect: CGRect) {
            
            // Draw background
            UIColor.white.setFill()
            UIRectFill(rect)

            // Draw snow-capped peak
            let peakPath = UIBezierPath()
            peakPath.move(to: CGPoint(x: rect.midX, y: 0))
            peakPath.addLine(to: CGPoint(x: rect.midX - 60, y: rect.height * 0.6))
            peakPath.addLine(to: CGPoint(x: rect.midX + 60, y: rect.height * 0.6))
            peakPath.close()
            UIColor.white.setFill()
            peakPath.fill()

            // Draw mountain body
            let mountainPath = UIBezierPath()
            mountainPath.move(to: CGPoint(x: rect.midX - 100, y: rect.height))
            mountainPath.addLine(to: CGPoint(x: rect.midX - 250, y: rect.height * 0.6))
            mountainPath.addLine(to: CGPoint(x: rect.midX + 250, y: rect.height * 0.6))
            mountainPath.addLine(to: CGPoint(x: rect.midX + 100, y: rect.height))
            mountainPath.close()
            UIColor.gray.setFill()
            mountainPath.fill()

            // Draw volcanic crater
            let craterPath = UIBezierPath(ovalIn: CGRect(x: rect.midX - 50, y: rect.height * 0.3, width: 100, height: 100))
            UIColor.black.setFill()
            craterPath.fill()

            // Draw crater smoke
            let smokePath = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.height * 0.3),
                                         radius: 40,
                                         startAngle: 0,
                                         endAngle: CGFloat.pi * 2,
                                         clockwise: true)
            UIColor.lightGray.setFill()
            smokePath.fill()
        }
}

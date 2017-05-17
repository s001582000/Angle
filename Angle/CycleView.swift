//
//  CycleView.swift
//  Angle
//
//  Created by 梁雅軒 on 2017/5/17.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class CycleView: UIView {
    var progress:CGFloat = 0
    var progressLayer:CAShapeLayer!
    
    func drawProgress(progress:CGFloat) {
        self.progress = progress
        progressLayer.opacity = 0
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: 100, y: 100)
        let radius:CGFloat = 90
        let startA:CGFloat = -(CGFloat)(M_PI_2)
        let endA = -CGFloat(M_PI_2) + CGFloat(M_PI) * 2 * self.progress
        
        progressLayer = CAShapeLayer()
        progressLayer.frame = self.bounds
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.red.cgColor
        progressLayer.opacity = 1
        progressLayer.lineCap = kCALineCapRound
        progressLayer.lineWidth = 10
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startA, endAngle: endA, clockwise: true)
        progressLayer.path = path.cgPath
        self.layer.addSublayer(progressLayer)
        
        let gradientLayer = CALayer()
        let leftLayer = CAGradientLayer()
        leftLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width/2, height: self.bounds.size.height)
        leftLayer.locations = [0.3,0.9,1]
        leftLayer.colors = [UIColor.yellow.cgColor,UIColor.green.cgColor]
        gradientLayer.addSublayer(leftLayer)
        
        
        let rightLayer = CAGradientLayer()
        rightLayer.frame = CGRect(x: self.bounds.size.width/2, y: 0, width: self.bounds.size.width/2, height: self.bounds.size.height)
        rightLayer.locations = [0.3,0.9,1]
        rightLayer.colors = [UIColor.yellow.cgColor,UIColor.red.cgColor]
        gradientLayer.addSublayer(rightLayer)
        gradientLayer.mask = progressLayer
        self.layer.addSublayer(gradientLayer)
        
    }
}

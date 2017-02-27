//
//  ShapeView.swift
//  GestureRecognizer
//
//  Created by Le Ngoc Hoan on 2/26/17.
//  Copyright © 2017 Le Ngoc Hoan. All rights reserved.
//

import Foundation
import UIKit

class ShapeView: UIView {
    let size: CGFloat = 150.0
    let lineWidth: CGFloat = 3
    var fillColor: UIColor!
    
    init(origin: CGPoint) {
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        self.fillColor = randomColor()
        self.center = origin
        self.backgroundColor = UIColor.clear
        initGestureRecognizers()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("Init(coder) has not been implemented")
    }
    
    func initGestureRecognizers() {
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(didPan))
        addGestureRecognizer(panGR)
        
        let pinchGR = UIPinchGestureRecognizer(target: self, action: #selector(didPinch))
        addGestureRecognizer(pinchGR)
        
        let rotationGR = UIRotationGestureRecognizer(target: self, action: #selector(didRotate))
        addGestureRecognizer(rotationGR)
    }
    
    func didPan(panGR: UIPanGestureRecognizer) {
        self.superview?.bringSubview(toFront: self)
        var translation = panGR.translation(in: self)
        translation = __CGPointApplyAffineTransform(translation, self.transform)
        self.center.x += translation.x
        self.center.y += translation.y
        panGR.setTranslation(CGPoint(x: 0, y: 0), in: self)
    }
    
    func didPinch(pinchGR: UIPinchGestureRecognizer) {
        self.superview?.bringSubview(toFront: self)
        let scale = pinchGR.scale
        self.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    func didRotate(rotationGR: UIRotationGestureRecognizer) {
        self.superview?.bringSubview(toFront: self)
        let rotation = rotationGR.rotation
        self.transform = CGAffineTransform(rotationAngle: rotation)
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect.insetBy(dx: lineWidth/2, dy: lineWidth/2), cornerRadius: 10)
        self.fillColor.setFill()
        path.fill()
        path.lineWidth = self.lineWidth
        UIColor.black.setStroke()
        path.stroke()
    }

    func randomColor() -> UIColor {
        let hue: CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        return UIColor(hue: hue, saturation: 0.8, brightness: 1.0, alpha: 0.8)
    }
}

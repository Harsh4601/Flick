//
//  WaveAnimation.swift
//  Interactions
//
//  Created by Harsh Londhekar on 30/09/21.
//

import Foundation
import UIKit

class WaveAnimation : CALayer{
    var animationGroup = CAAnimationGroup()
    var animationDuration : TimeInterval = 1.5
    var radius: CGFloat = 200
    var numberOfCircles: Float = 10
    
    override init (layer: Any){
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(numberOfCircles: Float = 10, radius: CGFloat, position: CGPoint){
        super.init()
        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        self.numberOfCircles = numberOfCircles
        self.position = position
        
        self.bounds = CGRect(x: 0, y: 0, width: radius*2, height: radius*2)
        self.cornerRadius = radius
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.setupAnimationGroup()
            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "wave")
                
            }
        }
    }
    
    func scaleAnimation()->CABasicAnimation{
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: 0)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = animationDuration
        return scaleAnimation
    }
    
    func newOpacityAnimation() -> CAKeyframeAnimation{
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = animationDuration
        opacityAnimation.keyTimes = [0,0.3,1]
        opacityAnimation.values = [0.4,0.8,0]
        return opacityAnimation
    }
    
    func setupAnimationGroup(){
        self.animationGroup.duration = animationDuration
        self.animationGroup.repeatCount = numberOfCircles
        let defaultCurve = CAMediaTimingFunction(name: .default)
        self.animationGroup.timingFunction = defaultCurve
        self.animationGroup.animations = [scaleAnimation(),newOpacityAnimation()]
    }
    
}


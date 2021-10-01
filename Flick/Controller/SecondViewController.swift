//
//  SecondViewController.swift
//  Interactions
//
//  Created by Harsh Londhekar on 29/09/21.
//

import UIKit


class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var clickMe: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
    }
    
    @IBAction func clickMeTapped(_ sender: UIButton) {
        
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
        
        
            let wave = WaveAnimation(numberOfCircles: 5, radius: 200, position: sender.center)
            wave.animationDuration = 1.0
            wave.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 0.9843137255, alpha: 1)
            self.view.layer.insertSublayer(wave, below: self.view.layer)
        
    }
    
   
    

}

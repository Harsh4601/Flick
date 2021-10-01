//
//  ViewController.swift
//  Interactions
//
//  Created by Harsh Londhekar on 29/09/21.
//

import UIKit

class FirstViewController: UIViewController, UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let previewScreen = storyboard?.instantiateViewController(withIdentifier: "previewScreen")
        return previewScreen
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        let finalView = storyboard?.instantiateViewController(withIdentifier: "fullScreen")
        show(finalView!, sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available
        {
            registerForPreviewing(with: self, sourceView: view)
        }else{
            print("device not compatible")
        }
        
    }
    
    

}





//
//  ScreenContainerViewController.swift
//  SLE Helper
//
//  Created by Christopher Turner on 2/12/19.
//  Copyright © 2019 LeBehrSoftware. All rights reserved.
//

import UIKit

class ScreenContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func transition(to child: UIViewController, duration: Double = 0.3, completion: ((Bool) -> Void)? = nil){
        let current = children.last
        addChild(child)
        
        navigationItem.title = child.title
        
        let newView = child.view!
        newView.translatesAutoresizingMaskIntoConstraints = true
        newView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        newView.frame = view.bounds
        
        if let existing = current {
            existing.willMove(toParent: nil)
            
            transition(from: existing, to: child, duration: duration, options: [.transitionCrossDissolve], animations: {}, completion: {done in
                existing.removeFromParent()
                child.didMove(toParent: self)
                completion?(done)
            })
        } else {
            view.addSubview(newView)
            
            UIView.animate(withDuration: duration, delay: 0, options: [.transitionCrossDissolve], animations: {}, completion: { done in
                child.didMove(toParent: self)
                completion?(done)
            })
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

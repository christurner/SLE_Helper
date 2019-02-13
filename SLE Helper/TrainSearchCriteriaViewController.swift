//
//  TrainSearchCriteriaViewController.swift
//  SLE Helper
//
//  Created by Christopher Turner on 2/12/19.
//  Copyright © 2019 LeBehrSoftware. All rights reserved.
//

import UIKit

protocol TrainSearchCriteriaViewDelegate: class {
    func startSearch(with trainNumber: Int)
}

class TrainSearchCriteriaViewController: UIViewController {

    weak var delegate: TrainSearchCriteriaViewDelegate?
    
    @IBOutlet weak var trainNumberInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func startSearch(){
        let trainNumberInputValue = trainNumberInput.text
        
        //valid it is a number
        
        print("Train #:\(trainNumberInputValue!)")
        
        if let trainNumber = Int(trainNumberInputValue!){
            delegate?.startSearch(with: trainNumber)
        }
        
        
        
    }

    @IBAction func searchPressed(sender: Any) {
        startSearch()
    }

}


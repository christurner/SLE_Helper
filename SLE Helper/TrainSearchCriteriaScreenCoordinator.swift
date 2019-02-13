//
//  TrainSearchCriteriaCoordinator.swift
//  SLE Helper
//
//  Created by Christopher Turner on 2/12/19.
//  Copyright © 2019 LeBehrSoftware. All rights reserved.
//

import UIKit

class TrainSearchCriteriaScreenCoordinator: Coordinator {

    let storyboard: UIStoryboard
    let dataService: DataService
    
    weak var searchCriteriaViewDelegate: TrainSearchCriteriaViewDelegate?
    
    required init(with storyboard: UIStoryboard, trainSearchCriteriaViewDelegate: TrainSearchCriteriaViewDelegate, dataService: DataService) {
        self.storyboard = storyboard
        self.dataService = dataService
        self.searchCriteriaViewDelegate = trainSearchCriteriaViewDelegate
        
        super.init()
    }
    
    func start() {
        let searchCriteriaViewController = self.storyboard.instantiateViewController(withIdentifier: "TrainSearchCriteriaViewController") as! TrainSearchCriteriaViewController
        searchCriteriaViewController.delegate = self
        self.container.transition(to: searchCriteriaViewController)
    }
    
}

extension TrainSearchCriteriaScreenCoordinator: TrainSearchCriteriaViewDelegate {
    func startSearch(with trainNumber: Int) {
        print("in screen coordinator")
        searchCriteriaViewDelegate?.startSearch(with: trainNumber)
    }
}


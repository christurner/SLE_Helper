//
//  TrainStatusFlowController.swift
//  SLE Helper
//
//  Created by Christopher Turner on 2/12/19.
//  Copyright © 2019 LeBehrSoftware. All rights reserved.
//

import UIKit

class TrainStatusFlowController: NSObject {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let navigationController = UINavigationController()
    let dataService: DataService
    
    var searchCriteriaCoordinator: TrainSearchCriteriaScreenCoordinator?
    var statusScreenCoordinator: TrainStatusScreenCoordinator?
    var scheduleScreenCoordinator: TrainScheduleScreenCoordinator?
    
    
    init(dataService: DataService) {
        print ("init")
        self.dataService = dataService
        
        super.init()
        
        navigationController.delegate = self
    }
    
    func start() {
        showSearchCriteria()
    }
    
    func showSearchCriteria() {
        searchCriteriaCoordinator = TrainSearchCriteriaScreenCoordinator(with: storyboard, trainSearchCriteriaViewDelegate: self, dataService: self.dataService)
        searchCriteriaCoordinator?.searchCriteriaViewDelegate = self
        searchCriteriaCoordinator?.start()
        
        
        
        navigationController.setViewControllers([searchCriteriaCoordinator!.container], animated: true)
    }
    
    func showTrainStatus(with trainNumber: Int) {
        statusScreenCoordinator = TrainStatusScreenCoordinator(with: storyboard, trainStatusDelegate: self, dataService: self.dataService, trainNumber: trainNumber)
        statusScreenCoordinator?.start()
        let test = statusScreenCoordinator!.container
        navigationController.pushViewController(test, animated: true)
    }
    
    func showTrainSchedule() {
        
    }
}

extension TrainStatusFlowController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if let container = navigationController.transitionCoordinator?.viewController(forKey: .from) as? ScreenContainerViewController, (container.children.first as? TrainScheduleViewController) != nil {
            
            scheduleScreenCoordinator = nil
        }
    }
    
}

extension TrainStatusFlowController: TrainSearchCriteriaViewDelegate {
    
    func startSearch(with trainNumber: Int) {
        print("in start search -> flow contorller")
        
        showTrainStatus(with: trainNumber)
    }
}

extension TrainStatusFlowController: TrainStatusViewDelegate {
    
}

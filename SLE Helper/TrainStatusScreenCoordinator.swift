//
//  TrainStatusScreenCoordinator.swift
//  SLE Helper
//
//  Created by Christopher Turner on 2/12/19.
//  Copyright © 2019 LeBehrSoftware. All rights reserved.
//

import UIKit

class TrainStatusScreenCoordinator: Coordinator {
    
    let storyboard: UIStoryboard
    let dataService: DataService
    let trainNumber: Int
    
    weak var statusDelegate: TrainStatusViewDelegate?
    weak var scheduleDelegate: TrainScheduleScreenCoordinator?

    required init(with storyboard: UIStoryboard, trainStatusDelegate: TrainStatusViewDelegate, dataService: DataService, trainNumber: Int) {
        self.storyboard = storyboard
        self.dataService = dataService
        self.statusDelegate = trainStatusDelegate
        self.trainNumber = trainNumber
        
        super.init()
    }
    
    func start() {
        
        let statusScreenViewController = self.storyboard.instantiateViewController(withIdentifier: "TrainStatusViewController")
        
        self.container.transition(to: statusScreenViewController)
        
        /*container.transition(to: LoadingViewController(), duration: 0, completion: { _ in
            //load any data for status?
            
            
        })*/
    }
    
}

protocol TrainStatusViewDelegate: class {
    
}

protocol DataService {
    
}

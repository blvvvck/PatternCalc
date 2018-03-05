//
//  CalcRouter.swift
//  CalcMVP
//
//  Created by BLVCK on 27/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation
import UIKit

class CalcRouter: CalcRouterProtocol {
    
    weak var view: UIViewController!
    var alertFactory: AlertFactoryProtocol!
    
    func showAlert(with errorMessage: String) {
        let alert = alertFactory.getAlert(with: errorMessage)
        view.present(alert, animated: true, completion: nil)        
    }
    
}

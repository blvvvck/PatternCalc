//
//  CalcConfigurator.swift
//  CalcMVP
//
//  Created by BLVCK on 27/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation
import UIKit

class CalcConfigurator {
    
    static func setupModule() -> ViewController? {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CalcView") as! ViewController
        
        let presenter = CalcPresenter()
        let iteractor = CalcInteractor()
        let router = CalcRouter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = iteractor
        
        iteractor.presenter = presenter
        
        router.view = viewController
        
        let alertFactorys = AlertFactory()
        presenter.alertFactory = alertFactorys
        presenter.router = router
        
        return viewController
    }
    

}

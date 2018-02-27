//
//  AlertFactoryProtocol.swift
//  CalcMVP
//
//  Created by BLVCK on 27/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation
import UIKit

protocol AlertFactoryProtocol {
    
    func getAlert(with message: String) -> UIAlertController
    
}

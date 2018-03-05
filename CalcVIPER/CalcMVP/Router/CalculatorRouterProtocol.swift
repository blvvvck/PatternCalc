//
//  CalcRouterProtocol.swift
//  CalcMVP
//
//  Created by BLVCK on 27/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation
import UIKit

protocol CalcRouterProtocol {
    
    /// Отобразить алерт
    ///
    /// - Parameter alert: сообщение для отображения в алерте
    func showAlert(with errorMessage: String)
    
}

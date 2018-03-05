//
//  CalcInteractorOutput.swift
//  CalcMVP
//
//  Created by BLVCK on 27/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation

protocol CalcInteractorOutput: class {
    
    /// Вычисление завершено
    ///
    /// - Parameter result: результат вычисления
    func didFinishCalculate(with result: CalcResult)
    
}

//
//  CalcResult.swift
//  CalcMVP
//
//  Created by BLVCK on 27/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation


/**
 Результаты вычислений.
 
 - success: Вычисление прошло удачно.
 - failure: Во время вычисления произошла ошибка.
 */
enum CalcResult {
    case success(with: Double)
    case failure(with: String)
}

//
//  CalcView.swift
//  CalcMVP
//
//  Created by BLVCK on 25/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation

protocol CalcView: class {
    
    /// Отображает числа в окне ввода
    ///
    /// - Parameter digit: отображаемое число
    func setDigits(digit: String)
}

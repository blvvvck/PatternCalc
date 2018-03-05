//
//  CalcIInteractorInput.swift
//  CalcMVP
//
//  Created by BLVCK on 27/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation

protocol CalcInteractorInput: class {
    
    /// знак арифметической операции
    var sign: Signs { get set }
    /// первое чилсо
    var firstNumber: Double { get set }
    /// второе чилсо
    var secondNumber: Double { get set }
    /// флаг, отвечающий за первое/второе число
    var isTyping: Bool { get set }
    
    /// Сосчитать результат
    ///
    /// - Parameters:
    ///   - symbol: говорит о том, как считать(унарная или бинарная операция)
    func calculate(with symbol: String)
    
}

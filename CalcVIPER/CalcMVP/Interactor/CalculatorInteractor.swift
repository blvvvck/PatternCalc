//
//  CalcInteractor.swift
//  CalcMVP
//
//  Created by BLVCK on 27/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation

class CalcInteractor: CalcInteractorInput {

    weak var presenter: CalcInteractorOutput!
    
    var sign: Signs = .nullifier
    var firstNumber: Double = 0.0
    var secondNumber: Double = 0.0
    var isTyping: Bool = false
    
    let errorMessage = "Нельзя делить на ноль"

    func calculate(with symbol: String)  {
       
        var result: Double
        
        let operation = symbol
        if operation == "X²" {
            sign = .square
        }
        if operation == "%" {
            sign = .percent
        }
        
        if (sign == .divide && secondNumber == 0) {
            presenter.didFinishCalculate(with: .failure(with: errorMessage))
        }
        
        switch sign {
        case .addition : result = firstNumber + secondNumber
        case .subtraction: result =  firstNumber - secondNumber
        case .multiply: result =  firstNumber * secondNumber
        case .divide: result =  firstNumber / secondNumber
        case .square: result =  secondNumber * secondNumber
        case .percent: result =  secondNumber / 100
        default: result =  secondNumber
        }
        
        presenter.didFinishCalculate(with: .success(with: result))
    }
    
}

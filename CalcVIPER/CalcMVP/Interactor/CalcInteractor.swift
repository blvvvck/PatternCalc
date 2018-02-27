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
    
    let errorMessage = "Нельзя делить на ноль"

    func calculate(with firstNumber: Double, secondNumber: Double, sign: Signs)  {
       
        var result: Double
        
        if (sign == .divide && secondNumber == 0) {
            presenter.didFinishCalculate(with: .Failure(errorMessage))
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
        
        presenter.didFinishCalculate(with: .Success(result))
    }
    
}

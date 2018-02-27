//
//  CalcPresenter.swift
//  CalcMVP
//
//  Created by BLVCK on 25/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation

class CalcPresenter: CalcViewOutput, CalcInteractorOutput {

    weak var view: CalcView?
    var interactor: CalcInteractorInput!
    var router: CalcRouterProtocol!
    var alertFactory: AlertFactoryProtocol!
    
    
    var isTyping = false
    var firstNumber = 0.0
    var sign: Signs = .nullifier
    
    func digitPressed(with digit: String, and resultLabel: String) {
        
        if digit == "." && (resultLabel.contains(".")) {
            return
        }
        
        if isTyping {
            view?.setDigits(digit: resultLabel + digit)
            
        } else {
            view?.setDigits(digit: digit)
            isTyping = true
        }
    }
    
    func resetPressed() {
        view?.setDigits(digit: "0")
        firstNumber = 0
        sign = .nullifier
        isTyping = false
    }
    
    func signPressed(with sign: String, and resultLabel: String) {
        firstNumber = Double(resultLabel)!
        self.sign = Signs(rawValue: sign)!
        isTyping = false
        
    }
    
    func calculatePressed(with symbol: String, and resultLabel: String) {
        let secondNumber = Double(resultLabel)!
        
        let operation = symbol
        if operation == "X²" {
            sign = .square
        }
        if operation == "%" {
            sign = .percent
        }
        
        interactor.calculate(with: firstNumber, secondNumber: secondNumber, sign: sign)
        
        firstNumber = 0.0
        isTyping = false
        sign = .nullifier
    }
    
    
    func didFinishCalculate(with result: CalcResult) {
        switch result {
        case .Success(let currentResult):
            view?.setDigits(digit: String(currentResult))
        case .Failure(let errorString):
            let alert = alertFactory.getAlert(with: errorString)
            router.showAlert(with: alert)
            view?.setDigits(digit: " ")
        }
    }
    
}

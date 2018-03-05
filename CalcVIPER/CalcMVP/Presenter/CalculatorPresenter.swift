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
    
    let dotDigit = "."
    let zeroDigit = "0"
    
    func digitPressed(with digit: String, and resultLabel: String) {
        
        if digit == dotDigit && (resultLabel.contains(dotDigit)) {
            return
        }
        
        if interactor.isTyping {
            view?.setDigits(digit: resultLabel + digit)
            
        } else {
            view?.setDigits(digit: digit)
            interactor.isTyping = true
        }
    }
    
    func resetPressed() {
        view?.setDigits(digit: zeroDigit)
        interactor.firstNumber = 0
        interactor.secondNumber = 0
        interactor.sign = .nullifier
        interactor.isTyping = false
    }
    
    func signPressed(with sign: String, and resultLabel: String) {
        guard let currentFirstNumber = Double(resultLabel) else { return }
        interactor.firstNumber = currentFirstNumber
        
        guard let currentSign = Signs(rawValue: sign) else { return }
        interactor.sign = currentSign
        
        interactor.isTyping = false
    }
    
    func calculatePressed(with symbol: String, and resultLabel: String) {
        guard let currentSecondNumber = Double(resultLabel) else { return }
        interactor.secondNumber = currentSecondNumber

        interactor.calculate(with: symbol)
        
        interactor.firstNumber = 0.0
        interactor.isTyping = false
        interactor.sign = .nullifier
    }
    
    
    func didFinishCalculate(with result: CalcResult) {
        switch result {
        case .success(let currentResult):
            view?.setDigits(digit: String(currentResult))
        case .failure(let errorString):
            router.showAlert(with: errorString)
            view?.setDigits(digit: " ")
        }
    }
}

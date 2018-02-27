//
//  CalcPresenter.swift
//  CalcMVP
//
//  Created by BLVCK on 25/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation

enum Signs: String {
    case addition = "+"
    case subtraction = "-"
    case multiply = "✕"
    case divide = "/"
    case percent = "%"
    case square = "X²"
    case nullifier = ""
}

class CalcPresenter: CalcViewPresenter {

    weak var view: CalcView?
    
    var isTyping = false
    var firstNumber = 0.0
    var sign: Signs = .nullifier
    
    required init(calcView: CalcView) {
        self.view = calcView
    }
    
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
        
        if (sign == .divide && secondNumber == 0) {
            view?.showAlert(with: "Нельзя делить на ноль")
            view?.setDigits(digit: "")
            firstNumber = 0.0
            isTyping = false
            sign = .nullifier
        }
        
        let operation = symbol
        if operation == "X²" {
            sign = .square
        }
        if operation == "%" {
            sign = .percent
        }
        
        let result = calculate(secondNumber)
        
        view?.setDigits(digit: String(result))
        firstNumber = 0.0
        isTyping = false
        sign = .nullifier
    }
    
    private func calculate(_ secondNumber: Double) -> Double {
        switch sign {
        case .addition : return firstNumber + secondNumber
        case .subtraction: return firstNumber - secondNumber
        case .multiply: return firstNumber * secondNumber
        case .divide: return firstNumber / secondNumber
        case .square: return secondNumber * secondNumber
        case .percent: return secondNumber / 100
        default: return secondNumber
        }
    }
}

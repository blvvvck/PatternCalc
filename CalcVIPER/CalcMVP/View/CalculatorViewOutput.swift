//
//  CalcViewPresenter.swift
//  CalcMVP
//
//  Created by BLVCK on 25/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation

protocol CalcViewOutput {
    
    /// Нажатие на знак(цифра, точка)
    ///
    /// - Parameters:
    ///   - digit: цифра(точка)
    ///   - resultLabel: текущее окно ввода
    func digitPressed(with digit: String, and resultLabel: String)
    
    /// Нажатие очищает окно ввода
    func resetPressed()
    
    /// Нажатие на арифметический оператор
    ///
    /// - Parameters:
    ///   - sign: арифметический оператор
    ///   - resultLabel: текущее окно ввода
    func signPressed(with sign: String, and resultLabel: String)
    
    /// Нажатие на "равно" или на оператора, не требующего второго числа
    ///
    /// - Parameters:
    ///   - symbol: знак "равно" или оператор
    ///   - resultLabel: текущее окно ввода
    func calculatePressed(with symbol: String, and resultLabel: String)
}

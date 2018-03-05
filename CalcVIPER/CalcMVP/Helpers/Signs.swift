//
//  Signs.swift
//  CalcMVP
//
//  Created by BLVCK on 27/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation

/// Арифметические операции
///
/// - addition: сложение
/// - subtraction: вычитание
/// - multiply: умножение
/// - divide: деление
/// - percent: процент числа
/// - square: возведение в квадрат
/// - nullifier: обнуление знака
enum Signs: String {
    case addition = "+"
    case subtraction = "-"
    case multiply = "✕"
    case divide = "/"
    case percent = "%"
    case square = "X²"
    case nullifier = ""
}

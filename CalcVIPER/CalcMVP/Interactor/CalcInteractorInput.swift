//
//  CalcIInteractorInput.swift
//  CalcMVP
//
//  Created by BLVCK on 27/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation

protocol CalcInteractorInput: class {
    
    func calculate(with firstNumber: Double, secondNumber: Double, sign: Signs)
    
}

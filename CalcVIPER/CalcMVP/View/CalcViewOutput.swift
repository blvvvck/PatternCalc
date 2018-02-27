//
//  CalcViewPresenter.swift
//  CalcMVP
//
//  Created by BLVCK on 25/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import Foundation

protocol CalcViewOutput {
    func digitPressed(with digit: String, and resultLabel: String)
    func resetPressed()
    func signPressed(with sign: String, and resultLabel: String)
    func calculatePressed(with symbol: String, and resultLabel: String)
}

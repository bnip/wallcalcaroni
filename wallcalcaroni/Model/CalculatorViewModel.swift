//
//  Calculation.swift
//  wallcalcaroni
//
//  Created by Caleb Stultz on 1/4/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import Foundation

struct CalculatorViewModel: Equatable{
    var valueA: Int = 0
    var valueB: Int = 0
    var currentOperand: Operand?
    var valueEntryArray: [Int] = []
    
    mutating func insert(value: Int) { 
        if valueA == 0 {
            self.valueA = value
        } else {
            self.valueB = value
        }
    }
    
    mutating func set(operand: Operand) {
        self.currentOperand = operand
        setValues()
    }
    
    mutating func append(_ value: Int) {
        valueEntryArray.append(value)
    }
    
    mutating func clearValues() -> String {
        valueEntryArray = []
        valueA = 0
        valueB = 0
        return "\(valueEntryArray.count)"
    }
    
    func stringifyValues() -> String {
        var stringArray: [String] = []
        for int in valueEntryArray {
            stringArray.append(String(int))
        }
        return stringArray.joined()
    }
    
    mutating func setValues() {
        var valueString = ""
        _ = valueEntryArray.map { valueString = valueString + "\($0)" }
        guard let intValue = Int(valueString) else { return }
        insert(value: intValue)
        valueEntryArray = []
    }
    
    mutating func calculate() -> Int {
        setValues()
        guard let currentOperand = currentOperand else { fatalError() }
        switch currentOperand {
        case .add:
            return valueB + valueA
        case .subtract:
            return valueA - valueB
        case .multiply:
            return valueA * valueB
        case .divide:
            return valueA / valueB
        }
    }
}

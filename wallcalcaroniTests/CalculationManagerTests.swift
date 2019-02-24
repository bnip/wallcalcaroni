//
//  CalculationManagerTests.swift
//  wallcalcaroniTests
//
//  Created by Kerbal on 2/24/19.
//  Copyright © 2019 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import wallcalcaroni

class CalculationManagerTests: XCTestCase {

    //sut = System Under Test
    var sut:CalculationManager!
    
    override func setUp() {
        super.setUp()
        sut = CalculationManager()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testInit_WhenGivenValues_TakesValues() {
        let calcManger1 = CalculationManager(valueA: 10, valueB: 20, currentOperand: .multiply, valueEntryArray: [])
        let calcManger2 = CalculationManager(valueA: 10, valueB: 20, currentOperand: .multiply, valueEntryArray: [])
        XCTAssertEqual(calcManger1, calcManger2)
    }
    
    func testValues_AreInitiallyZer() {
        XCTAssertEqual(sut.valueA, 0)
        XCTAssertEqual(sut.valueB, 0)
    }
    
    func testValues_InsertingValues_ChangesValueA(){
        sut.insert(value: 10)
        XCTAssertEqual(sut.valueA, 10)
    }
    
    func testOperand_IsInitiallyNil() {
        XCTAssertNil(sut.currentOperand, "Operand Should be nil")
    }
    
    func testOpperand_WhenGivenOperand_SetsOperand() {
        sut.insert(value: 20)
        sut.set(operand: .subtract)
        XCTAssertNotNil(sut.currentOperand)
    }
    
    func testCalculation_ForValues() {
        sut.insert(value: 15)
        sut.set(operand: .subtract)
        sut.insert(value: 5)
        XCTAssertEqual(sut.calculate(), 10)
    }
    
    func testClear_WhenCalledClearsValues() {
        sut.insert(value: 20)
        _ = sut.clearValues()
        XCTAssertEqual(sut.valueA, 0)
        XCTAssertEqual(sut.valueB, 0)
        XCTAssertEqual(sut.valueEntryArray, [])
    }
}

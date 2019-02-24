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
    
}

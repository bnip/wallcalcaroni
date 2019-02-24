//
//  CalculatorViewControllerTests.swift
//  wallcalcaroniTests
//
//  Created by Kerbal on 2/24/19.
//  Copyright © 2019 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import wallcalcaroni

class CalculatorViewControllerTests: XCTestCase {
    
    var sut: CalculatorViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = (storyboard.instantiateViewController(withIdentifier: "CalculatorViewController") as! CalculatorViewController)
        sut.loadViewIfNeeded() //Needed to have access to buttons
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testAddingValue_ShouldAppendAndUpdateLabel() {
        sut.twoBtn.sendActions(for: .touchUpInside)
        sut.fiveBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "25")
    }
}

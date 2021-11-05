//
//  BoretAppTests.swift
//  BoretAppTests
//
//  Created by Sebastian San Blas on 04/11/2021.
//

import XCTest

class BoretAppTests: XCTestCase {

    var sut: another!

    override func setUpWithError() throws {
        sut = another()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testConverterWithCero(){
        let estimated = "Free"
        let output = sut.convertToPriceString(input: 0)
        XCTAssertEqual(estimated, output)
    }
    
    func testConverterWithCero25(){
        let estimated = "Low"
        let output = sut.convertToPriceString(input: 0.25)
        XCTAssertEqual(estimated, output)
    }
    
    func testConverterWithCero3(){
        let estimated = "Low"
        let output = sut.convertToPriceString(input: 0.3)
        XCTAssertEqual(estimated, output)
    }
    
    func testConverterWithCero45(){
        let estimated = "Medium"
        let output = sut.convertToPriceString(input: 0.45)
        XCTAssertEqual(estimated, output)
    }

    func testConverterWithCero6(){
        let estimated = "Medium"
        let output = sut.convertToPriceString(input: 0.6)
        XCTAssertEqual(estimated, output)
    }
    
    func testConverterWithCero8(){
        let estimated = "High"
        let output = sut.convertToPriceString(input: 0.8)
        XCTAssertEqual(estimated, output)
    }
}

//
//  GeomUtilsTests.swift
//  JelloSwift
//
//  Created by Luiz Fernando Silva on 06/03/15.
//  Copyright (c) 2015 Luiz Fernando Silva. All rights reserved.
//

import XCTest
@testable import JelloSwift

class GeomUtilsTests: XCTestCase
{
    static var allTests = [
        ("testLineRatio", testLineRatio),
        ("testLineRatioCentralized", testLineRatioCentralized)
    ]
    
    func testLineRatio()
    {
        let pt1 = Vector2(x: 0, y: 0)
        let pt2 = Vector2(x: 10, y: 10)
        
        // Edge cases
        XCTAssertEqual(pt1, calculateVectorRatio(pt1, vec2: pt2, ratio: 0), "Failed to calculate point in line correctly")
        XCTAssertEqual(pt2, calculateVectorRatio(pt1, vec2: pt2, ratio: 1), "Failed to calculate point in line correctly")
        
        // Mid-way
        XCTAssertEqual((pt1 + pt2) / 2, calculateVectorRatio(pt1, vec2: pt2, ratio: 0.5), "Failed to calculate point in line correctly")
    }
    
    func testLineRatioCentralized()
    {
        let pt1 = Vector2(x: -10, y: -10)
        let pt2 = Vector2(x: 10, y: 10)
        
        // Edge cases
        XCTAssertEqual(pt1, calculateVectorRatio(pt1, vec2: pt2, ratio: 0), "Failed to calculate point in line correctly")
        XCTAssertEqual(pt2, calculateVectorRatio(pt1, vec2: pt2, ratio: 1), "Failed to calculate point in line correctly")
        
        // Mid-way
        XCTAssertEqual((pt1 + pt2) / 2, calculateVectorRatio(pt1, vec2: pt2, ratio: 0.5), "Failed to calculate point in line correctly")
    }
}

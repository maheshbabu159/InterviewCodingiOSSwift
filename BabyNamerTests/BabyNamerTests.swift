//
//  BabyNamerTests.swift
//  BabyNamerTests
//
//  Created by Matt Bonness on 1/24/17.
//  Copyright © 2017 Motorola Solutions Inc. All rights reserved.
//

import XCTest
@testable import BabyNamer

class BabyNamerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // TODO - get this test to pass
    func testBabyNameFactory() {
        let babyNameFactory = BabyNameFactory();
        let babyName = babyNameFactory.generateNameForGender(aGender: Gender.Unknown)
        XCTAssert(babyName != nil)
        XCTAssert(babyName!.getName() != nil)
        XCTAssert(babyName!.getName()!.characters.count > 0);
        XCTAssert(isCapitalized(s: name!))
        XCTAssert(babyName!.getGender() != nil)
        XCTAssert(babyName!.getGender()! == Gender.Male)
    }
    
    func isCapitalized(s: String) -> Bool {
        let pattern = "[A-Z][a-z]+"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let numberOfMatches = regex.numberOfMatches(in: s, options: [], range: NSRange(location: 0, length: s.characters.count))
        return numberOfMatches > 0
    }
    
}

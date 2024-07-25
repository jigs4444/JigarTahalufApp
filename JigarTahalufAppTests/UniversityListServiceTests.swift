//
//  UniversityListServiceTests.swift
//  JigarTahalufAppTests
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation
import XCTest
@testable import JigarTahalufApp

class UniversityListServiceTests: XCTestCase {
    
    var service: UniversityListService!

    override func setUp() {
        super.setUp()
        service = UniversityListService()
    }

    override func tearDown() {
        service = nil
        super.tearDown()
    }

    func testGetUniversitiesSuccess() {
        let expectation = self.expectation(description: "Fetch universities")

        service.getUniversitiesList(country: "United Arab Emirates") { result in
            switch result {
            case .success(let universities):
                XCTAssertGreaterThan(universities.count, 0)
            case .failure(let error):
                XCTFail("Expected success, got failure with \(error)")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testGetUniversitiesFailure() {
        let expectation = self.expectation(description: "Fetch universities with failure")

        service.getUniversitiesList(country: "Invalid Country") { result in
            switch result {
            case .success:
                XCTFail("Expected failure, got success")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}

//
//  UniversityListInteractorTests.swift
//  JigarTahalufAppTests
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation
import XCTest
@testable import JigarTahalufApp

class UniversityListInteractorTests: XCTestCase {
    var interactor: UniversityListInteractor!
    var mockPresenter: MockPresenter!
    var mockService: UniversityListService!

    override func setUp() {
        super.setUp()
        mockPresenter = MockPresenter()
        mockService = UniversityListService()
        interactor = UniversityListInteractor()
        interactor.presenter = mockPresenter
        interactor.service = mockService
    }

    override func tearDown() {
        interactor = nil
        mockPresenter = nil
        mockService = nil
        super.tearDown()
    }

    func testFetchUniversitiesSuccess() {
        
        
        interactor.fetchUniversities(country: "United Arab Emirates")
        
        XCTAssertTrue(mockPresenter.didFetchUniversitiesCalled)
        XCTAssertFalse(mockPresenter.didFailToFetchUniversitiesCalled)
    }

    func testFetchUniversitiesFailure() {
        
        
        interactor.fetchUniversities(country: "Invalid Country")
        
        XCTAssertFalse(mockPresenter.didFetchUniversitiesCalled)
        XCTAssertTrue(mockPresenter.didFailToFetchUniversitiesCalled)
    }
}

class MockPresenter: UniversityListInteractorOutputProtocol {
    var didFetchUniversitiesCalled = false
    var didFailToFetchUniversitiesCalled = false

    func didGetUniversitiesData(_ universities: [JigarTahalufApp.University]) {
        didFetchUniversitiesCalled = true
    }
    
    func didFailToGetUniversitiesData(error: String) {
        didFailToFetchUniversitiesCalled = true
    }
}

class MockService: UniversityListServiceProtocol {
    var result: Result<[University], TahalufNetworkError>!
    
    func getUniversitiesList(country: String, completion: @escaping (Result<[University],TahalufNetworkError>) -> Void) {
        completion(result)
    }
}

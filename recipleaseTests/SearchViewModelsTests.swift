//
//  ViewModelsTests.swift
//  recipleaseTests
//
//  Created by Paul Ghibeaux on 11/11/2021.
//

import XCTest

@testable import reciplease

class HomeVMTests: XCTestCase {

    var homeVM: SearchViewModel!
    var mockAPIService: MockService!
        // ----------------------------------
        //  MARK: - Product Collection -
        //
    override func setUp() {
        super.setUp()
        mockAPIService = MockService()
        homeVM = SearchViewModel(apiService: mockAPIService)
    }
    
    override func tearDown() {
        homeVM = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func test_fetch_collection() {
        // Given
       
        // When
        homeVM.loadData {_ in
            XCTAssertNotNil(self.homeVM.sections)
        }
        
        // Assert
       
    }
    

    
}

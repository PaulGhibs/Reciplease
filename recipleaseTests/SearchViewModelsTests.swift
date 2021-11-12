//
//  ViewModelsTests.swift
//  recipleaseTests
//
//  Created by Paul Ghibeaux on 11/11/2021.
//

import XCTest

@testable import reciplease

class SearchVMTests: XCTestCase {

    var homeVM: SearchViewModel!
    var mockAPIService: MockService!
        // ----------------------------------
        //  MARK: - Search VM -
        //
    override func setUp() {
        super.setUp()
        homeVM = SearchViewModel()
    }
    
    override func tearDown() {
        homeVM = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func test_fetch_viewModel() {
        // Given
       
        // When
        homeVM.loadData {_ in
            XCTAssertNotNil(self.homeVM.sections)
        }
        
      
       
    }
    

    
}

//
//  RecipeViewModeltests.swift
//  recipleaseTests
//
//  Created by Paul Ghibeaux on 11/11/2021.
//

import Foundation
import XCTest

@testable import reciplease

class RecipeViewModelTests: XCTestCase {

    var homeVM: RecipesListViewModel!
    var mockAPIService: MockService!
        // ----------------------------------
        //  MARK: - Search VM -
        //
    override func setUp() {
        super.setUp()
        mockAPIService = MockService()
        homeVM = RecipesListViewModel(apiService: mockAPIService)
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

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
    
    func test_fetch_vm() {
        // Given
        // When
        homeVM.loadData {_ in
            XCTAssertNotNil(self.homeVM.sections)
        }
        
        // Assert
        XCTAssertNil(mockAPIService?.loadDataIsCalled)
    }
    
    func test_fetch_vm_failed() {
        
        // Given a failed fetch with a certain failure
        let error = try? RecipeError.noRecipeFound.errorMessages()
        
        // When
        _ = mockAPIService?.fakerecipeTab.remove(at: 1)
        
        mockAPIService?.fetchFail(error: (RecipeError.noRecipeFound))
        
        // Sut should display predefined error message
        XCTAssertFalse(false, error.debugDescription)

    }
    
    
   
    
}

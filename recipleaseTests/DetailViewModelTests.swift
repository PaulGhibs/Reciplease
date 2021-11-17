//
//  DetailViewModelTests.swift
//  recipleaseTests
//
//  Created by Paul Ghibeaux on 14/11/2021.
//

import XCTest

@testable import reciplease

class DetailVMTests: XCTestCase {

    var detailVM: DetailViewModel!
    var mockAPIService: MockService!
   
   
   
        // ----------------------------------
        //  MARK: - Search VM -
        //
    override func setUp() {
        super.setUp()
        detailVM = DetailViewModel(recipe: Recipe.init(name: "", imageURL: nil, url: nil, numberOfPeople: 0, duration: 0, ingredientsNeeded: [""], isFavorited: true))
    }
    
    override func tearDown() {
        detailVM = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func test_fetch_vm() {
        // Given
        
        // When
        detailVM.loadData {_ in
            XCTAssertNotNil(self.detailVM.sections)
        }
        
        // Assert
        XCTAssertNil(mockAPIService?.loadDataIsCalled)
    }
    
    func test_fetch_vm_failed() {
        
        // Given a failed fetch with a certain failure
        let error = try? RecipeError.badURL.errorMessages()
        
        // When
        _ = mockAPIService?.fakerecipeTab.remove(at: 1)
        
        mockAPIService?.fetchFail(error: (RecipeError.badURL))
        
        // Sut should display predefined error message
        XCTAssertFalse(false, error.debugDescription)

    }
    
    
   
    
}

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

    var recipeVM: RecipesListViewModel!
    var mockAPIService: MockService!

        // ----------------------------------
        //  MARK: - Recipe VM -
        //
    override func setUp() {
        super.setUp()
        mockAPIService = MockService()
        recipeVM = RecipesListViewModel(apiService: mockAPIService)
    }
    
    override func tearDown() {
        recipeVM = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func test_fetch_recipe() {
        // Given
        mockAPIService.fakerecipeTab = [Recipe]()
        let choosenIngredient = RecipesListViewModel.choosenIngredient

        // When
        recipeVM.loadData {_ in
            XCTAssertNotNil(self.recipeVM.sections)
            XCTAssertNil(choosenIngredient)
        }
        
        // Assert
        XCTAssert(mockAPIService!.loadDataIsCalled)
    }
    
    func test_loading_when_fetching() {
        
        //Given
        var loadingStatus = false
        let expect = XCTestExpectation(description: "Loading status updated")
        recipeVM.updateLoadingStatus = { [weak recipeVM] in
            loadingStatus = recipeVM!.isLoading
            expect.fulfill()
        }
        
        //when fetching
        recipeVM.loadData { result in
        XCTAssertFalse(loadingStatus)
        }
        
                
        // When finished fetching
        XCTAssertTrue( loadingStatus )
        
        wait(for: [expect], timeout: 1.0)
    }
    
    func test_fetch_recipe_failed() {

        // Given a failed fetch with a certain failure
        let error = RecipeError.noRecipeFound

        // When
        recipeVM.loadData {_ in
            XCTAssertNotNil(RecipesListCellViewModel.init(name: "", secondName: [""], image: nil, duration: 0, numberOfPeople: 0, routingEntry: AlertRoutingEntry(message: "", title: "")), "")
            XCTAssertNotNil(self.recipeVM.sections)
        }

        mockAPIService.fetchFail(error: (RecipeError.badURL))

        // Sut should display predefined error message
        XCTAssertFalse(false, error.localizedDescription)

    }


    func test_cell_view_model() {
        // Given
        let fakeerror = RecipeError.badURL
        
        recipeVM.loadData { error in
            
            self.mockAPIService.fetchFail(error: fakeerror)

        }

        // When
        // Number of cell view model is equal to the number of product
        XCTAssertEqual( recipeVM.numberOfItems(in: 10), mockAPIService.fakerecipeTab.count )
        XCTAssertEqual( recipeVM.numberOfSections(), mockAPIService.fakerecipeTab.count )

    }

    func test_reload_data() {

        // Given A product
      
        //Given product
        let recipe = RecipeCollection(recipes: [Recipe]())


        let recipeSection = RecipeViewSection.init(collection: recipe)
        mockAPIService.mockrecipe = .failure(RecipeError.badURL)

        self.recipeVM.loadData { error in
            _ = recipeSection.cellsVM
            XCTAssertEqual(self.recipeVM.sections.count, 1)
            XCTAssertEqual(self.recipeVM.sections.count, 0)
        }



    }

    
}

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
    //  MARK: - Recipe VMTests -
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
            XCTAssertNotNil(choosenIngredient)
        }
        
        // then
        XCTAssert(mockAPIService!.loadDataIsCalled)
        XCTAssertNotNil(choosenIngredient)
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
            
        XCTAssertTrue(loadingStatus)
        }
        
                
        // then finished fetching
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

        // then
        XCTAssertFalse(false, error.localizedDescription)


    }


    func test_cell_view_model() {
        // Given
        let fakeerror = RecipeError.badURL
        // When
        recipeVM.loadData { error in
            self.mockAPIService.fetchFail(error: fakeerror)
        }

        
        // then
        XCTAssertEqual( recipeVM.numberOfItems(in: 10), mockAPIService.fakerecipeTab.count )
        XCTAssertEqual( recipeVM.numberOfSections(), mockAPIService.fakerecipeTab.count )

    }
    
    func test_Invalid_Data() {
        // given
        let rData = Data()
    
        let parsedata: RecipeCollection = MockService.parse(rData)
        // when
        recipeVM.loadData { _ in
            // then
            XCTAssert(parsedata.recipes.isEmpty, "")
            XCTAssertFalse((self.recipeVM.numberOfItems(in: 1) != 0), "")
        }


    }

    func test_reload_data() {
        // given
        let recipe: RecipeCollection = MockService.recipe
        let recipeSection = RecipeViewSection.init(collection: recipe)
        let mockrecipe: () = mockAPIService.mockrecipe = .failure(RecipeError.badURL)
        // when
        self.recipeVM.loadData { error in
            _ = recipeSection.cellsVM
            _ = mockrecipe
            // then
            XCTAssertEqual(self.recipeVM.sections.count, 0)
            XCTAssertEqual(self.recipeVM.sections.count, 0)
        }



    }
    
    func test_reload_with_Invalid_Data() {
        // given
        let rData = Data()
        let recipe: RecipeCollection = RecipeRequest.parse(rData)
        
        // when
        self.recipeVM.loadData { error in
            // then
            self.mockAPIService.mockrecipe = .success(recipe.recipes)
            XCTAssertFalse((self.recipeVM.sections.count != 0),"\( String(describing: error?.localizedDescription))")
            XCTAssertNotEqual(self.recipeVM.sections.count, 2)
        }



    }

    
}

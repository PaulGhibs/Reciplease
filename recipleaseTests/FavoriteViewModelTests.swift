//
//  FavoriteViewModelTests.swift
//  recipleaseTests
//
//  Created by Paul Ghibeaux on 11/11/2021.
//

import Foundation
import XCTest

@testable import reciplease

class FavoriteViewModelTests: XCTestCase {

    var recipeVM: FavoriteViewModel!
    var mockAPIService: MockService!

        // ----------------------------------
        //  MARK: - Favorite VM -
        //
    override func setUp() {
        super.setUp()
        mockAPIService = MockService()
        recipeVM = FavoriteViewModel()
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
        XCTAssertTrue(loadingStatus)
        }
        
                
        // When finished fetching
        XCTAssertTrue( loadingStatus )
        
        wait(for: [expect], timeout: 1.0)
    }
    
    func test_fetch_Favorite_failed() {

        // Given a failed fetch with a certain failure
        let error = try? RecipeError.deletedFromFavorites.errorMessages()


        // When
        recipeVM.loadData {_ in
            XCTAssertNotNil(self.recipeVM.sections)
        }

        mockAPIService.fetchFail(error: (RecipeError.badURL))

        // Sut should display predefined error message
        XCTAssertFalse(false, error.debugDescription)

    }


    func test_cell_view_model() {
        // Given
        
        
        recipeVM.loadData { error in
           _ =  self.mockAPIService.completeClosure
            self.mockAPIService.mockrecipe = .failure(RecipeError.noRecipeFound)
            _ = Favorite.all
            Favorite.deleteAll()
           _ = FavoriteCellViewModel.init(name: "", secondName: ["String"], image: nil, duration: 0, numberOfPeople: 0, routingEntry: AlertRoutingEntry(message: "", title: ""))
        }

        // When
        // Number of cell view model is equal to the number of product
        XCTAssertNotEqual( recipeVM.numberOfItems(in: 0), mockAPIService.fakerecipeTab.count )
        XCTAssertNotEqual( recipeVM.numberOfSections(), mockAPIService.fakerecipeTab.count )

    }

    func test_reload_data() {

      
        
        let favorites = Favorite(context: AppDelegate.viewContext)
    
        let recipe = Recipe.init(name: favorites.name ?? "lemon", imageURL: favorites.imageURL, url: favorites.url, numberOfPeople: favorites.people, duration: favorites.duration, ingredientsNeeded: [""], isFavorited: favorites.liked)
        
        
        let recipes = RecipeCollection(recipes: [recipe])
        
        let recipeSection = FavoriteSection.init(collection: recipes)
        
        
        
        mockAPIService.mockrecipe = .success([recipe])

        self.recipeVM.loadData { error in
            
            XCTAssertFalse(recipeSection.cellsVM.isEmpty, "")
            self.recipeVM.remove(at: IndexPath(item: 0, section: 0))
            XCTAssertEqual(self.recipeVM.sections.count, 1)
            XCTAssertEqual(self.recipeVM.sections.count, 1)
        }



    }

    
}

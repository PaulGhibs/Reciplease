//
//  FavoriteViewModelTests.swift
//  recipleaseTests
//
//  Created by Paul Ghibeaux on 11/11/2021.
//

import Foundation
import XCTest
import CoreData

@testable import reciplease

class FavoriteViewModelTests: XCTestCase {

    var recipeVM: FavoriteViewModel!
    var mockAPIService: MockService!

    // ----------------------------------
    //  MARK: - Favorite VMtTests -
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
        
        // Then
        XCTAssert(mockAPIService!.loadDataIsCalled)
    }
    
    func test_loading_when_fetching() {
        
        // Given
        var loadingStatus = false
        let expect = XCTestExpectation(description: "Loading status updated")
        recipeVM.updateLoadingStatus = { [weak recipeVM] in
            loadingStatus = recipeVM!.isLoading
            expect.fulfill()
        }
        
        // When
        recipeVM.loadData { result in
        XCTAssertTrue(loadingStatus)
        }
        
                
        // Then
        XCTAssertTrue( loadingStatus )
        
        wait(for: [expect], timeout: 1.0)
    }
    
    func test_fetch_Favorite_failed() {

        // Given
        let error = try? RecipeError.deletedFromFavorites.errorMessages()


        // When
        recipeVM.loadData {_ in
            XCTAssertNotNil(self.recipeVM.sections)
        }

        mockAPIService.fetchFail(error: (RecipeError.badURL))

        // then
        XCTAssertFalse(false, error.debugDescription)

    }


    func test_cell_view_model() {
        // Given
        let complete = self.mockAPIService.completeClosure

        recipeVM.loadData { error in
            _ = complete
            // when
            self.mockAPIService.mockrecipe = .failure(RecipeError.noRecipeFound)
            
            Favorite.deleteAll()
            
           _ = FavoriteCellViewModel.init(name: "", secondName: ["String"], image: nil, duration: 0, numberOfPeople: 0, routingEntry: AlertRoutingEntry(message: "", title: ""))
        }

        
        // then
        XCTAssertNotEqual( recipeVM.numberOfItems(in: 0), Favorite.all.count )
        XCTAssertNotEqual( recipeVM.numberOfSections(), mockAPIService.fakerecipeTab.count )

    }

    func test_reload_data() {
        // given
        let favorites = Favorite(context: AppDelegate.viewContext)
        let recipe = Recipe.init(name: favorites.name ?? "lemon", imageURL: favorites.imageURL, url: favorites.url, numberOfPeople: favorites.people, duration: favorites.duration, ingredientsNeeded: [""], isFavorited: favorites.liked)
        let recipes = RecipeCollection(recipes: [recipe])
        let recipeSection = FavoriteSection.init(collection: recipes)
        
        
        // when
        mockAPIService.mockrecipe = .success([recipe])

        self.recipeVM.loadData { error in
            // then
            XCTAssertFalse(recipeSection.cellsVM.isEmpty, "\(String(describing: error?.localizedDescription))")
            self.recipeVM.remove(at: IndexPath(item: 0, section: 0))
            XCTAssertEqual(self.recipeVM.sections.count, 1)
            XCTAssertEqual(self.recipeVM.sections.count, 1)
        }



    }
    
    func testLoadingCoreData() {
        // given
        let expectation = XCTestExpectation(description: "core data model is set up")
        let container = NSPersistentContainer(name: "reciplease")
            // when
        container.loadPersistentStores { description, error in
            
            self.mockAPIService.fetchFail(error: error as? RecipeError)
            expectation.fulfill()
            XCTAssertNoThrow(error as? RecipeError)

        }
        // then
      
        wait(for: [expectation], timeout: 0.1)


    }

    
}

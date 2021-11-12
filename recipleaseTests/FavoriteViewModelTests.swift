//
//  FavoriteViewModelTests.swift
//  recipleaseTests
//
//  Created by Paul Ghibeaux on 11/11/2021.
//

import Foundation
import XCTest

@testable import reciplease

class FavoriteVMTests: XCTestCase {

    var homeVM: FavoriteViewModel!
        // ----------------------------------
        //  MARK: - Search VM -
        //
    override func setUp() {
        super.setUp()
        homeVM = FavoriteViewModel()
    }
    
    override func tearDown() {
        homeVM = nil
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

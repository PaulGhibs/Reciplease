//
//  recipleaseUITests.swift
//  recipleaseUITests
//
//  Created by Paul Ghibeaux on 14/11/2021.
//

import XCTest

class RecipleaseUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = true
        app = XCUIApplication()
        app.launch()

    }
    func testTabBarController() throws {
        // UI tests must launch the application that they test.
        app.launch()
        // passing throw the different view controllers of the tab bar
        app.tabBars.firstMatch.buttons.element(boundBy: 0).tap()
        app.tabBars.firstMatch.buttons.element(boundBy: 1).tap()
    }

    func testSearchViewController() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // search for translateTextfield
        XCTAssert(app.textFields["ingredientsTextField"].exists, "test text field doesn't exist" )
        let typef = app.textFields["ingredientsTextField"]
        typef.tap()    // must give text field keyboard focus!
        typef.typeText("sausages")
        app.buttons["addButton"].tap()
        app.buttons["Search for recipes"].tap()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        app.buttons["heart"].tap()
        app.buttons["Get Directions"].tap()
        app.tabBars.firstMatch.buttons.element(boundBy: 1).tap()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        XCTAssertFalse( typef.exists, "typef exists" )   // text field still exists
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testSearchemptyViewController() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // search for translateTextfield
        XCTAssert(app.textFields["ingredientsTextField"].exists, "test text field doesn't exist" )
        let typef = app.textFields["ingredientsTextField"]
        typef.tap()    // must give text field keyboard focus!
        typef.typeText("cheese")
        app.buttons["clear"].tap()
        app.buttons["Search for recipes"].tap()
        XCTAssertTrue( typef.exists, "typef exists" )   // text field still exists
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testFavoriteController() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.tabBars.firstMatch.buttons.element(boundBy: 1).tap()
        // search for convertviewcontroller
        // look for changetextfield
    }
}

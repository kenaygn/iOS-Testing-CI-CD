//
//  XCTest_ProjectUITests.swift
//  XCTest ProjectUITests
//
//  Created by Kenay on 03/03/26.
//

import XCTest

final class XCTest_ProjectUITests: XCTestCase {
    @MainActor
    func testAddGameToCart() throws {
        let app = XCUIApplication()
        app.activate()
    
        
        let addButton = app.buttons["addButton_1"]
        XCTAssertTrue(addButton.exists)
        
        addButton.tap()


        let quantityLabel = app.staticTexts["quantityLabel_1"]
        XCTAssertEqual(quantityLabel.label, "Qtd: 1")

        let totalItemsLabel = app.staticTexts["cartTotalItemsLabel"]
        XCTAssertEqual(totalItemsLabel.label, "Itens no carrinho: 1")

        let totalPriceLabel = app.staticTexts["cartTotalPriceLabel"]
        XCTAssertEqual(totalPriceLabel.label, "Total: R$ 199.90")
        
    }
    
    func testRemoveGameFromCart() throws {
        let app = XCUIApplication()
        app.activate()
        
        let removeOneButton = app.buttons["removeOneButton_1"]
        XCTAssertTrue(removeOneButton.exists)
        
        removeOneButton.tap()
        
        XCTAssertEqual(app.staticTexts["quantityLabel_1"].label, "Qtd: 0")
        XCTAssertEqual(app.staticTexts["cartTotalItemsLabel"].label, "Itens no carrinho: 0")
        XCTAssertEqual(app.staticTexts["cartTotalPriceLabel"].label, "Total: R$ 0.00")
    }

}

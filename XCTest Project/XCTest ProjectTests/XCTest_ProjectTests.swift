//
//  XCTest_ProjectTests.swift
//  XCTest ProjectTests
//
//  Created by Kenay on 03/03/26.
//

import XCTest
import Testing
@testable import XCTest_Project

@MainActor
final class StoreIntegrationTests: XCTestCase {

    func testCartFlowIntegration() {
        let viewModel = StoreViewModel()

        let gow = Game(id: 1, title: "God of War", price: 199.90)
        let tlou = Game(id: 2, title: "The Last of Us", price: 249.90)

        
        viewModel.addToCart(gow)
        viewModel.addToCart(tlou)

        XCTAssertEqual(viewModel.totalItems, 2)
        XCTAssertEqual(viewModel.cart.items.count, 2)

       
        viewModel.addToCart(gow)

        XCTAssertEqual(viewModel.quantity(for: gow), 2)
        XCTAssertEqual(viewModel.totalItems, 3)

        XCTAssertEqual(
            viewModel.total,
            199.90 * 2 + 249.90,
            accuracy: 0.001
        )

        viewModel.removeOne(gow)

        XCTAssertEqual(viewModel.quantity(for: gow), 1)
        XCTAssertEqual(viewModel.totalItems, 2)

        viewModel.removeAll(of: tlou)

        XCTAssertFalse(viewModel.contains(tlou))
        XCTAssertEqual(viewModel.totalItems, 1)

        viewModel.clearCart()

        XCTAssertTrue(viewModel.isCartEmpty)
        XCTAssertEqual(viewModel.totalItems, 0)
        XCTAssertEqual(viewModel.total, 0)
    }
}

@MainActor
struct StoreViewModelSwiftTesting {
    

    @Test
    func somarValores(){
        //Arrange
        let game1 = Game(id: 1, title: "Game 1", price: 100.0)
        let game2 = Game(id: 2, title: "Game 2", price: 60.0)
        
        let vm = StoreViewModel()
        
        //Act
        vm.addToCart(game1)
        vm.addToCart(game2)
        
        //Assert
        #expect(vm.total == 160.0)
    }
}


//Erro de Threads ao Utilizar o XCTest, com o Swift Testing funcinando sem problems

@MainActor
final class StoreViewModelTestes: XCTestCase {
    
    //test_<condicao>_<resultadoEsperado>
    func testSomarValoresDoCarrinho() {
        //Arrange
        let game1 = Game(id: 1, title: "Game 1", price: 100.0)
        let game2 = Game(id: 2, title: "Game 2", price: 60.0)
        
        let vm = StoreViewModel()
        //Act
        vm.addToCart(game1)
        vm.addToCart(game2)
        
        //Assert
        XCTAssertEqual(vm.cart.total, 160.0)
    }
    
    func testQuantidadeDeItensNoCarrinho(){
        
        //Arrange
        let game1 = Game(id: 1, title: "Game 1", price: 100.0)
        let game2 = Game(id: 2, title: "Game 2", price: 60.0)
        
        let vm = StoreViewModel()
        
        //Act
        vm.addToCart(game1)
        vm.addToCart(game2)
        vm.addToCart(game2)
                
        //Assert
        XCTAssertEqual(vm.cart.totalItems, 3)
    }
    
    func testRemoverDoCarrinho(){
        
        //Arrange
        let game1 = Game(id: 1, title: "Game 1", price: 100.0)
        
        let vm = StoreViewModel()
        
        //Act
        vm.addToCart(game1)
        vm.removeOne(game1)
        
        //Assert
        XCTAssertFalse(vm.contains(game1))
        
    }
    
    func testRemoverTudoDoCarrinho(){
        
        //Arrange
        let game1 = Game(id: 1, title: "Game 1", price: 100.0)
        
        let vm = StoreViewModel()
        
        //Act
        
        vm.addToCart(game1)
        vm.removeAll(of: game1)
        
        //Assert
        XCTAssertEqual(vm.cart.totalItems, 0)
    }
    
    func testFalsoParaSaberSeOCarrinhoEstaVazio(){
        //Arrange
        let game1 = Game(id: 1, title: "Game 1", price: 100.0)
        let vm = StoreViewModel()
        
        //Act
        vm.addToCart(game1)
        
        //Assert
        XCTAssertFalse(vm.isCartEmpty)
    }
    
    func testPositivoParaSaberSeOCarrinhoEstaVazio(){
        let vm = StoreViewModel()
        
        XCTAssertTrue(vm.isCartEmpty)
    }
    
    func testPegarItemDoCarrinho(){
        
        //Arrange
        let game1 = Game(id: 1, title: "Game 1", price: 100.0)
        let vm = StoreViewModel()
        
        //Act
        vm.addToCart(game1)
        
        //Assert
        XCTAssertTrue(vm.contains(game1))
            
    }
}

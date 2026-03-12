//
//  ContentView.swift
//  XCTest Project
//
//  Created by Kenay on 03/03/26.
//

import Foundation
import Observation

@MainActor
@Observable
class StoreViewModel {
    
    var cart: Cart

    init() {
        self.cart = Cart()
    }

    // MARK: - Add

    func addToCart(_ game: Game) {
        var currentItems = cart.items
        
        if let index = currentItems.firstIndex(where: { $0.game.id == game.id }) {
            var item = currentItems[index]
            item.quantity += 1
            currentItems[index] = item
        } else {
            let newItem = CartItem(game: game, quantity: 1)
            currentItems.append(newItem)
        }
        
        cart = Cart(items: currentItems)
    }

    // MARK: - Remove one

    func removeOne(_ game: Game) {
        var currentItems = cart.items
        
        guard let index = currentItems.firstIndex(where: { $0.game.id == game.id }) else {
            return
        }

        var item = currentItems[index]
        item.quantity -= 1

        if item.quantity <= 0 {
            currentItems.remove(at: index)
        } else {
            currentItems[index] = item
        }

        cart = Cart(items: currentItems)
    }

    // MARK: - Remove all

    func removeAll(of game: Game) {
        let filtered = cart.items.filter { $0.game.id != game.id }
        cart = Cart(items: filtered)
    }

    // MARK: - Set quantity

    func setQuantity(_ quantity: Int, for game: Game) {
        var currentItems = cart.items
        let safeQuantity = max(0, quantity)

        if let index = currentItems.firstIndex(where: { $0.game.id == game.id }) {
            if safeQuantity == 0 {
                currentItems.remove(at: index)
            } else {
                var item = currentItems[index]
                item.quantity = safeQuantity
                currentItems[index] = item
            }
        } else if safeQuantity > 0 {
            let newItem = CartItem(game: game, quantity: safeQuantity)
            currentItems.append(newItem)
        }

        cart = Cart(items: currentItems)
    }

    // MARK: - Clear cart

    func clearCart() {
        cart = Cart()
    }

    // MARK: - Helpers

    var total: Double {
        cart.total
    }

    var totalItems: Int {
        cart.items.reduce(0) { $0 + $1.quantity }
    }

    var isCartEmpty: Bool {
        cart.items.isEmpty
    }

    func quantity(for game: Game) -> Int {
        cart.items.first(where: { $0.game.id == game.id })?.quantity ?? 0
    }

    func contains(_ game: Game) -> Bool {
        cart.items.contains(where: { $0.game.id == game.id })
    }

    func item(for game: Game) -> CartItem? {
        cart.items.first(where: { $0.game.id == game.id })
    }
}

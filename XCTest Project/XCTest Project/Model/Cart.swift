//
//  Cart.swift
//  XCTest Project
//
//  Created by Kenay on 03/03/26.
//

import Foundation

struct Cart: Equatable {
    var items: [CartItem] = []
    
    init(items: [CartItem] = []) {
        self.items = items
    }
    
    var totalItems: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
    
    var total: Double {
        items.reduce(0) { $0 + $1.subtotal }
    }
    
    func quantity(for game: Game) -> Int {
        items.first(where: { $0.game.id == game.id })?.quantity ?? 0
    }
}

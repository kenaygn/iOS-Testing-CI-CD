//
//  CartItem.swift
//  XCTest Project
//
//  Created by Kenay on 03/03/26.
//

import Foundation

struct CartItem: Identifiable, Equatable {
    var id: Int { game.id }
    let game: Game
    var quantity: Int
    
    var subtotal: Double {
        game.price * Double(quantity)
    }
}

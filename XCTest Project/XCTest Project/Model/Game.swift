//
//  Game.swift
//  XCTest Project
//
//  Created by Kenay on 03/03/26.
//

import Foundation

struct Game: Identifiable, Equatable, Hashable {
    let id: Int
    let title: String
    let price: Double
    
    init(id: Int, title: String, price: Double) {
        self.id = id
        self.title = title
        self.price = price
    }
}

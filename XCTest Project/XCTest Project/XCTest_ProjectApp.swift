//
//  XCTest_ProjectApp.swift
//  XCTest Project
//
//  Created by Kenay on 03/03/26.
//

import SwiftUI

@main
struct XCTest_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                games: [
                    Game(id: 1, title: "God of War", price: 199.90),
                    Game(id: 2, title: "The Last of Us", price: 249.90),
                    Game(id: 3, title: "EA FC 26", price: 299.90)
                ]
                
            )
        }
    }
}

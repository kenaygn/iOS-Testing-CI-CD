//
//  GameRowView.swift
//  XCTest Project
//
//  Created by Kenay on 12/03/26.
//

import SwiftUI

struct GameRowView: View {
    
    let game: Game
    let quantity: Int
    let onAdd: () -> Void
    let onRemove: () -> Void
    let onRemoveAll: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(game.title)
                .font(.headline)
                .accessibilityIdentifier("gameName_\(game.id)")
            
            Text(String(format: "R$ %.2f", game.price))
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .accessibilityIdentifier("gamePrice_\(game.id)")
            
            HStack(spacing: 12) {
                Button("-1") {
                    onRemove()
                }
                .buttonStyle(.bordered)
                .accessibilityIdentifier("removeOneButton_\(game.id)")
                
                Text("Qtd: \(quantity)")
                    .frame(minWidth: 60)
                    .accessibilityIdentifier("quantityLabel_\(game.id)")
                
                Button("+1") {
                    onAdd()
                }
                .buttonStyle(.borderedProminent)
                .accessibilityIdentifier("addButton_\(game.id)")
                
                Button("Remover tudo") {
                    onRemoveAll()
                }
                .buttonStyle(.bordered)
                .tint(.red)
                .accessibilityIdentifier("removeAllButton_\(game.id)")
            }
        }
        .padding(.vertical, 8)
    }
}

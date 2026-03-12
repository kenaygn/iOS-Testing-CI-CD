//
//  ContentView.swift
//  XCTest Project
//
//  Created by Kenay on 03/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = StoreViewModel()
    let games: [Game]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                
                headerView
                
                if games.isEmpty {
                    ContentUnavailableView("Nenhum jogo encontrado", systemImage: "gamecontroller")
                        .accessibilityIdentifier("emptyGamesView")
                } else {
                    List(games, id: \.id) { game in
                        GameRowView(
                            game: game,
                            quantity: viewModel.quantity(for: game),
                            onAdd: {
                                viewModel.addToCart(game)
                            },
                            onRemove: {
                                viewModel.removeOne(game)
                            },
                            onRemoveAll: {
                                viewModel.removeAll(of: game)
                            }
                        )
                    }
                    .listStyle(.plain)
                    .accessibilityIdentifier("gamesList")
                }
                
                footerView
            }
            .padding(.top)
            .navigationTitle("Store")
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 8) {
            Text("Itens no carrinho: \(viewModel.totalItems)")
                .font(.headline)
                .accessibilityIdentifier("cartTotalItemsLabel")
            
            Text(String(format: "Total: R$ %.2f", viewModel.total))
                .font(.subheadline)
                .accessibilityIdentifier("cartTotalPriceLabel")
        }
    }
    
    private var footerView: some View {
        VStack(spacing: 12) {
            Button("Limpar carrinho") {
                viewModel.clearCart()
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isCartEmpty)
            .accessibilityIdentifier("clearCartButton")
            
            Text(viewModel.isCartEmpty ? "Carrinho vazio" : "Carrinho com itens")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .accessibilityIdentifier("cartStatusLabel")
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

#Preview {
    ContentView(
        games: [
            Game(id: 1, title: "God of War", price: 199.90),
            Game(id: 2, title: "The Last of Us", price: 249.90),
            Game(id: 3, title: "EA FC 26", price: 299.90)
        ]
        
    )
}

//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  Created by y.o.denisenko on 03.04.2022.
//

import Foundation
import SwiftUI

final class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let themes: [Theme<String>] = [
        .init(name: "Animals", content: Emojis.animals, numberOfPairs: 9, color: .red),
        .init(name: "Flowers", content: Emojis.plants, numberOfPairs: 5, color: .green),
        .init(name: "Vehicles", content: Emojis.vehicles, numberOfPairs: 6, color: .blue),
        .init(name: "Food", content: Emojis.food, numberOfPairs: 8, color: .orange),
        .init(name: "Clothes", content: Emojis.clothes, numberOfPairs: 7, color: .brown),
        .init(name: "Flags", content: Emojis.flags, numberOfPairs: 10, color: .indigo)
    ]
    
    private static func randomTheme() -> Theme<String> {
        themes.randomElement() ?? themes[0]
    }
    
    private static func createMemoryGame(with theme: Theme<String>) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairs: theme.numberOfPairs) { pairIndex in
            theme.content[0..<min(theme.content.count, theme.numberOfPairs)][pairIndex]
        }
    }
    
    @Published private var game: MemoryGame<String>
    @Published private var theme: Theme<String>
    
    var themeName: String {
        theme.name
    }
    var cards: [Card] {
        game.cards
    }
    var score: Int {
        game.score
    }
    var themeColor: Color {
        switch theme.color {
        case .indigo:
            return .indigo
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        case .orange:
            return .orange
        case .brown:
            return .brown
        }
    }
        
    init() {
        let theme = EmojiMemoryGame.randomTheme()
        game = EmojiMemoryGame.createMemoryGame(with: theme)
        self.theme = theme
    }
    
    // MARK: - Intent(s)
    
    func onChoose(_ card: Card) {
        game.choose(card)
    }
    
    func onNewGameTap() {
        theme = EmojiMemoryGame.randomTheme()
        game = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}

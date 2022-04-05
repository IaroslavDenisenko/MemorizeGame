//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  Created by y.o.denisenko on 03.04.2022.
//

import Foundation

final class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🚙", "🚝"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairs: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func onChoose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

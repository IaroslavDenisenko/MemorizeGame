//
//  MemorizeGame.swift
//  MemorizeGame
//
//  Created by y.o.denisenko on 03.04.2022.
//

import Foundation

struct MemoryGame<CardContent> {
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }

    var cards: [Card]
    
    init(numberOfPairs: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairs {
            let cardContent = createCardContent(pairIndex)
            cards.append(Card(content: cardContent))
            cards.append(Card(content: cardContent))
        }
    }
    
    func choose(_ card: Card) {
        
    }
}

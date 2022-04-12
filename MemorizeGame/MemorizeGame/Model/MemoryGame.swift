//
//  MemorizeGame.swift
//  MemorizeGame
//
//  Created by y.o.denisenko on 03.04.2022.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var hasBeenSeen = false
        let content: CardContent
        let id: Int
    }

    var cards = [Card]()
    var score: Int
    private var faceUpCardIndex: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.onlyOne }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    init(numberOfPairs: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        score = 0
        for pairIndex in 0..<numberOfPairs {
            let cardContent = createCardContent(pairIndex)
            cards.append(Card(content: cardContent, id: pairIndex * 2))
            cards.append(Card(content: cardContent, id: pairIndex * 2 + 1))
        }
        self.cards = cards.shuffled()
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           chosenIndex != faceUpCardIndex, !cards[chosenIndex].isMatched {
            
            if let faceUpCardIndex = faceUpCardIndex {
                if cards[faceUpCardIndex].content == cards[chosenIndex].content {
                    cards[faceUpCardIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                    score += 2
                } else {
                    if cards[faceUpCardIndex].hasBeenSeen || cards[chosenIndex].hasBeenSeen {
                        score -= 1
                    }
                    cards[faceUpCardIndex].hasBeenSeen = true
                    cards[chosenIndex].hasBeenSeen = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                faceUpCardIndex = chosenIndex
            }
        }
    }
}

private extension Array {
    var onlyOne: Element? {
        count == 1 ? first : nil
    }
}

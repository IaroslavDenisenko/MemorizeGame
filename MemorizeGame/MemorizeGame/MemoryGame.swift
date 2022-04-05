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
        var content: CardContent
        var id: Int
    }

    var cards: [Card]
    var faceUpCardIndex: Int?
    
    init(numberOfPairs: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairs {
            let cardContent = createCardContent(pairIndex)
            cards.append(Card(content: cardContent, id: pairIndex * 2))
            cards.append(Card(content: cardContent, id: pairIndex * 2 + 1))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           chosenIndex != faceUpCardIndex, !cards[chosenIndex].isMatched {
            
            if let faceUpCardIndex = faceUpCardIndex {
                if cards[faceUpCardIndex].content == cards[chosenIndex].content {
                    cards[faceUpCardIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                self.faceUpCardIndex = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                faceUpCardIndex = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
}

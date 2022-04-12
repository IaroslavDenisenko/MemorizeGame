//
//  EmojiGameView.swift
//  MemorizeGame
//
//  Created by y.o.denisenko on 02.04.2022.
//

import SwiftUI

private extension CGFloat {
    static let aspectRatio: CGFloat = 2/3
    static let cardsPadding: CGFloat = 4
}

struct EmojiGameView: View {
  
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!") 
            HStack {
                Text("score: \(game.score)")
                Spacer()
                Text(game.themeName)
            }
            Spacer()
            AspectVGrid(items: game.cards, aspectRatio: .aspectRatio) { card in
                cardView(for: card)
            }
            Button {
                game.onNewGameTap()
            } label: {
                Text("New Game")
            }
        }
        .font(.largeTitle)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(.zero)
        } else {
            CardView(card: card)
                .padding(.cardsPadding)
                .onTapGesture { game.onChoose(card) }
                .foregroundColor(game.themeColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.onChoose(game.cards.first!)
        
        return Group {
            EmojiGameView(game: game)
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 12 mini")
        }
    }
}

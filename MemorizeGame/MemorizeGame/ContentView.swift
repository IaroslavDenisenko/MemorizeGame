//
//  ContentView.swift
//  MemorizeGame
//
//  Created by y.o.denisenko on 02.04.2022.
//

import SwiftUI

struct ContentView: View {
  
    @ObservedObject var game = EmojiMemoryGame()
    
    var body: some View {
        VStack {
            Text("Memorize!") 
            HStack {
                Text("score: \(game.score)")
                Spacer()
                Text(game.themeName)
            }
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture { game.onChoose(card) }
                            .foregroundColor(game.themeColor)
                    }
                }
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
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isMatched {
                shape.opacity(0)
            } else if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 12 mini")
        }
    }
}

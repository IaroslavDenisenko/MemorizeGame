//
//  CardView.swift
//  MemorizeGame
//
//  Created by y.o.denisenko on 09.04.2022.
//

import SwiftUI

private enum Constants {
    static let cornerRadius: CGFloat = 10
    static let borderWidth: CGFloat = 3
    static let fontScale: CGFloat = 0.7
    static let circlePadding: CGFloat = 5
    static let circleOpacity: Double = 0.5
    static let startAngle: Double = -90
    static let endAngle: Double = 20
    
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
                if card.isMatched {
                    shape.opacity(.zero)
                } else if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: Constants.borderWidth)
                    Pie(startAngle: Angle(degrees: Constants.startAngle), endAngle: Angle(degrees: Constants.endAngle))
                        .padding(Constants.circlePadding)
                        .opacity(Constants.circleOpacity)
                    Text(card.content).font(font(in: geometry.size))
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.height, size.width) * Constants.fontScale)
    }
}

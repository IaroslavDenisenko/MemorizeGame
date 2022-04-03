//
//  ContentView.swift
//  MemorizeGame
//
//  Created by y.o.denisenko on 02.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State var count = 4
    let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🚙", "🚝"]
    
    var body: some View {
        VStack {
            Text("Memorize!")
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<count], id: \.self) {
                        CardView(content: $0).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                addButton
                Spacer()
                removeButton
            }
        }
        .font(.largeTitle)
        .padding(.horizontal)
    }
    
    var addButton: some View {
        Button {
            if count < emojis.count {
                count += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var removeButton: some View {
        Button {
            if count > 1 {
                count -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct CardView: View {
    @State var isFaceUp = true
    let content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        .foregroundColor(.red)
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

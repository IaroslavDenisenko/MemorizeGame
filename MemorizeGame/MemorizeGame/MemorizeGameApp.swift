//
//  MemorizeGameApp.swift
//  MemorizeGame
//
//  Created by y.o.denisenko on 02.04.2022.
//

import SwiftUI

@main
struct MemorizeGameApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiGameView(game: game)
        }
    }
}

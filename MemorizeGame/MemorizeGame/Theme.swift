//
//  Theme.swift
//  MemorizeGame
//
//  Created by y.o.denisenko on 07.04.2022.
//

import Foundation

struct Theme<Content: Equatable> {
    
    enum Color {
        case red
        case green
        case blue
        case orange
        case brown
        case indigo
    }
    
    let name: String
    let content: [Content]
    let numberOfPairs: Int
    let color: Color
}

//
//  EmptyTileView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/25/24.
//

import SwiftUI

struct EmptyTileView: View {
    @EnvironmentObject var puzzle: Puzzle
    let tile = Tile(tileColor: .empty)
    
    var body: some View {
        Rectangle()
            .foregroundColor(tile.tileColor.color)
            .frame(width: tileSize, height: tileSize)
            .border(.black)
    }

    var tileSize: CGFloat {
        return puzzle.tileSize
    }
}

#Preview {
    EmptyTileView()
        .environmentObject(ExamplePuzzles.letterX)
        .padding()
}

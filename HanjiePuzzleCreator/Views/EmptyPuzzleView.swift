//
//  EmptyPuzzleView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/24/24.
//

import SwiftUI

struct EmptyPuzzleView: View {
    @Binding var puzzle: Puzzle

    var body: some View {

        VStack (spacing: 0.0) {
            ForEach(puzzle.puzzleTiles.tiles.indices, id: \.self) { yIndex in
                HStack (spacing: 0.0) {
                    ForEach(puzzle.puzzleTiles.tiles[yIndex].tiles.indices, id: \.self) { xIndex in
                        TileView(tile: Tile(), size: puzzle.tileSize)
                    }
                }
            }
        }.frame(width: puzzle.tileSize*CGFloat(puzzle.width), height: puzzle.tileSize*CGFloat(puzzle.height), alignment: .center)

    }
}

#Preview {
    @Previewable @State var puzzle = Puzzle()
    @Previewable @State var frame = Puzzle.framed
    @Previewable @State var four = Puzzle.fourDots
    @Previewable @State var x = Puzzle.letterX
    @Previewable @State var crosshair = Puzzle.crosshair

    VStack {
        EmptyPuzzleView(puzzle: $puzzle).padding()
        EmptyPuzzleView(puzzle: $crosshair).padding()
        EmptyPuzzleView(puzzle: $frame).padding()
        EmptyPuzzleView(puzzle: $four).padding()
        EmptyPuzzleView(puzzle: $x).padding()
    }

}

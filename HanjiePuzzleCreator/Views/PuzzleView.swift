    //
    //  PuzzleView.swift
    //  HanjiePuzzleCreator
    //
    //  Created by Hasan Edain on 9/23/24.
    //

import SwiftUI

struct PuzzleView: View {
    @Binding var puzzle: Puzzle
    var tileSize: CGFloat = 16

    var body: some View {
        
        VStack (spacing: 0.0) {
            ForEach($puzzle.puzzleTiles.tiles.indices, id: \.self) { yIndex in
                HStack (spacing: 0.0) {
                    ForEach($puzzle.puzzleTiles.tiles[yIndex].tiles.indices, id: \.self) { xIndex in
                        TileView(tile: puzzle.puzzleTiles.tiles[yIndex].tiles[xIndex], size: tileSize)
                    }
                }
            }
        }.frame(width: tileSize*CGFloat(puzzle.width), height: tileSize*CGFloat(puzzle.height), alignment: .center)
        
    }
}


#Preview {
    @Previewable @State var puzzle = Puzzle()
    @Previewable @State var frame = Puzzle.framed
    @Previewable @State var four = Puzzle.fourDots
    @Previewable @State var x = Puzzle.letterX
    @Previewable @State var crosshair = Puzzle.crosshair

    VStack {
        PuzzleView(puzzle: $puzzle).padding()
        PuzzleView(puzzle: $crosshair).padding()
        PuzzleView(puzzle: $frame).padding()
        PuzzleView(puzzle: $four).padding()
        PuzzleView(puzzle: $x).padding()
    }

}

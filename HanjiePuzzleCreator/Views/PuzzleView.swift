    //
    //  PuzzleView.swift
    //  HanjiePuzzleCreator
    //
    //  Created by Hasan Edain on 9/23/24.
    //

import SwiftUI

struct PuzzleView: View {
    @ObservedObject var puzzle: Puzzle

    var body: some View {
        
        VStack (spacing: 0.0) {
            ForEach($puzzle.puzzleTiles.tileLines.indices, id: \.self) { yIndex in
                HStack (spacing: 0.0) {
                    ForEach(puzzle.puzzleTiles.tileLines[yIndex].tiles.indices, id: \.self) { xIndex in
                        TileView(tile: puzzle.puzzleTiles.tileLines[yIndex].tiles[xIndex], size: puzzle.tileSize)
                    }
                }
            }
        }.frame(width: puzzle.tileSize*CGFloat(puzzle.width),
                height: puzzle.tileSize*CGFloat(puzzle.height),
                alignment: .center)
    }
}

#Preview {
    let puzzle = Puzzle()
    let frame = Puzzle.framed
    let four = Puzzle.fourDots
    let x = Puzzle.letterX
    let crosshair = Puzzle.crosshair

    VStack {
        PuzzleView(puzzle: puzzle).padding()
        PuzzleView(puzzle: crosshair).padding()
        PuzzleView(puzzle: frame).padding()
        PuzzleView(puzzle: four).padding()
        PuzzleView(puzzle: x).padding()
    }

}

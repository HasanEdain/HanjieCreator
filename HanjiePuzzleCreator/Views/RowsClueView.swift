//
//  RowsClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct RowsClueView: View {
    @ObservedObject var puzzle: Puzzle

    var body: some View {
        horizontalClues()
    }

    @ViewBuilder func horizontalClues() -> some View {
        VStack (spacing: 0){
            ForEach(puzzle.puzzleTiles.tileLines.indices, id: \.self) { xIndex in
                HorizontalClueView(tileLine: puzzle.puzzleTiles.tileLines[xIndex], size: puzzle.tileSize)
            }
        }
    }
}

#Preview {
    let fourDotPuzzle = Puzzle.fourDots
    let letterXPuzzle = Puzzle.letterX
    let framedPuzzle = Puzzle.framed
    let crosshairPuzzle = Puzzle.crosshair
    let dash = Puzzle.dash

    VStack {
        RowsClueView(puzzle: fourDotPuzzle)
            .background(.red)
        RowsClueView(puzzle: letterXPuzzle)
            .background(.blue)
        RowsClueView(puzzle: framedPuzzle)
            .background(.red)
        RowsClueView(puzzle: crosshairPuzzle)
            .background(.blue)
        RowsClueView(puzzle: dash)
            .background(.red)
    }
}


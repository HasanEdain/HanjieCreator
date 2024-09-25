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
            ForEach(puzzle.puzzleTiles.tiles.indices, id: \.self) { xIndex in
                HorizontalClueView(tileLine: puzzle.puzzleTiles.tiles[xIndex], size: puzzle.tileSize)
            }
        }
    }
}

#Preview {
    @Previewable @State var fourDotPuzzle = Puzzle.fourDots
    @Previewable @State var letterXPuzzle = Puzzle.letterX
    @Previewable @State var framedPuzzle = Puzzle.framed
    @Previewable @State var crosshairPuzzle = Puzzle.crosshair
    @Previewable @State var dash = Puzzle.dash

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


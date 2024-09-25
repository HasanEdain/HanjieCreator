//
//  ColumnsClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct ColumnsClueView: View {
    @ObservedObject var puzzle: Puzzle

    var body: some View {
        verticalClues()
    }

    @ViewBuilder func verticalClues() -> some View {
        HStack (spacing: 0){
            ForEach(puzzle.puzzleTiles.tiles.indices, id: \.self) { yIndex in
                VerticalClueView(tileLine: puzzle.column(number: yIndex), size: puzzle.tileSize).frame(height: puzzle.column(number: yIndex).stringSize(tileSize: puzzle.tileSize))
            }
        }
    }
}

#Preview {
    @Previewable @State var fourDotPuzzle = Puzzle.fourDots
    @Previewable @State var letterXPuzzle = Puzzle.letterX
    @Previewable @State var framedPuzzle = Puzzle.framed
    @Previewable @State var crosshair = Puzzle.crosshair
    @Previewable @State var dash = Puzzle.dash

    VStack {
        ColumnsClueView(puzzle: fourDotPuzzle)
            .background(.red)
            .padding()
        ColumnsClueView(puzzle: letterXPuzzle)
            .background(.red)
            .padding()
        ColumnsClueView(puzzle: framedPuzzle)
            .background(.red)
            .padding()
        ColumnsClueView(puzzle: crosshair)
            .background(.red)
            .padding()
        ColumnsClueView(puzzle: dash)
            .background(.red)
            .padding()
    }

}

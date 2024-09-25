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
            ForEach(puzzle.puzzleTiles.tileLines.indices, id: \.self) { yIndex in
                VerticalClueView(tileLine: puzzle.column(number: yIndex), size: puzzle.tileSize).frame(height: puzzle.column(number: yIndex).stringSize(tileSize: puzzle.tileSize))
            }
        }
    }
}

#Preview {
    let fourDotPuzzle = Puzzle.fourDots
    let letterXPuzzle = Puzzle.letterX
    let framedPuzzle = Puzzle.framed
    let crosshair = Puzzle.crosshair
    let dash = Puzzle.dash

    VStack {
        ColumnsClueView(puzzle: fourDotPuzzle)
            .border(.red)
            .padding()
        ColumnsClueView(puzzle: letterXPuzzle)
            .border(.red)
            .padding()
        ColumnsClueView(puzzle: framedPuzzle)
            .border(.red)
            .padding()
        ColumnsClueView(puzzle: crosshair)
            .border(.red)
            .padding()
        ColumnsClueView(puzzle: dash)
            .border(.red)
            .padding()
    }

}

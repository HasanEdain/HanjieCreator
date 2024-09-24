//
//  ColumnsClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct ColumnsClueView: View {
    @Binding var puzzle: Puzzle

    var body: some View {
        verticalClues()
    }

    @ViewBuilder func verticalClues() -> some View {
        HStack (spacing: 0){
            ForEach(tileLines().indices, id: \.self) { yIndex in
                VerticalClueView(tileLine: puzzle.column(number: yIndex), size: puzzle.tileSize)
            }
        }
    }

    func tileLines() -> [TileLine] {
        var clueTilesLines: [TileLine] = [TileLine]()
        for index in 0..<puzzle.width {
            let line = puzzle.column(number: index)
            clueTilesLines.append(line)
        }
        
        return clueTilesLines
    }
}

#Preview {
    @Previewable @State var fourDotPuzzle = Puzzle.fourDots
    @Previewable @State var letterXPuzzle = Puzzle.letterX
    @Previewable @State var framedPuzzle = Puzzle.framed
    @Previewable @State var crosshair = Puzzle.crosshair
    @Previewable @State var dash = Puzzle.dash

    VStack {
        ColumnsClueView(puzzle: $fourDotPuzzle)
            .padding()
        ColumnsClueView(puzzle: $letterXPuzzle)
            .padding()
        ColumnsClueView(puzzle: $framedPuzzle)
            .padding()
        ColumnsClueView(puzzle: $crosshair)
            .padding()
        ColumnsClueView(puzzle: $dash)
            .padding()
    }

}

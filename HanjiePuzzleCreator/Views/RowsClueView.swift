//
//  RowsClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct RowsClueView: View {
    @ObservedObject var puzzle: Puzzle
    @State var tileSize: CGFloat = 16

    var body: some View {
        horizontalClues()
    }

    @ViewBuilder func horizontalClues() -> some View {
        VStack (spacing: 0){
            ForEach(tileLines().indices, id: \.self) { xIndex in
                HorizontalClueView(tileLine: puzzle.row(number: xIndex), size: tileSize)
            }
        }
    }

    func tileLines() -> [TileLine] {
        var clueTilesLines: [TileLine] = [TileLine]()
        for index in 0..<puzzle.height {
            let line = puzzle.row(number: index)
            clueTilesLines.append(line)
        }

        return clueTilesLines
    }
}

#Preview {
    let fourDotPuzzle = Puzzle.fourDots
    let letterXPuzzle = Puzzle.letterX
    let framedPuzzle = Puzzle.framed
    let crosshairPuzzle = Puzzle.crosshair
    let dash = Puzzle.dash

    VStack {
        RowsClueView(puzzle: fourDotPuzzle, tileSize: 16.0)
            .background(.red)
        RowsClueView(puzzle: letterXPuzzle, tileSize: 16.0)
            .background(.blue)
        RowsClueView(puzzle: framedPuzzle, tileSize: 16.0)
            .background(.red)
        RowsClueView(puzzle: crosshairPuzzle, tileSize: 16.0)
            .background(.blue)
        RowsClueView(puzzle: dash, tileSize: 16.0)
            .background(.red)
    }
}


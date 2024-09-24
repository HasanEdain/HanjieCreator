//
//  RowsClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct RowsClueView: View {
    @ObservedObject var puzzle: Puzzle
    @State var tileSize: CGFloat = 14

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

    VStack {
        RowsClueView(puzzle: fourDotPuzzle, tileSize: 14.0)
        RowsClueView(puzzle: letterXPuzzle, tileSize: 14.0)
        RowsClueView(puzzle: framedPuzzle, tileSize: 14.0)
    }
}


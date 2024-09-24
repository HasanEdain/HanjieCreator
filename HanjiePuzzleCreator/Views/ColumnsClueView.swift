//
//  ColumnsClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct ColumnsClueView: View {
    @ObservedObject var puzzle: Puzzle
    @State var tileSize: CGFloat = 16

    var body: some View {
        verticalClues()
    }

    @ViewBuilder func verticalClues() -> some View {
        HStack (spacing: 0){
            ForEach(tileLines().indices, id: \.self) { yIndex in
                VerticalClueView(tileLine: puzzle.column(number: yIndex), size: tileSize)
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
    let fourDotPuzzle = Puzzle.fourDots
    let letterXPuzzle = Puzzle.letterX
    let framedPuzzle = Puzzle.framed
    let crosshair = Puzzle.crosshair
    let dash = Puzzle.dash

    VStack {
        ColumnsClueView(puzzle: fourDotPuzzle, tileSize: 16.0).padding()
        ColumnsClueView(puzzle: letterXPuzzle, tileSize: 16.0).padding()
        ColumnsClueView(puzzle: framedPuzzle, tileSize: 16.0).padding()
        ColumnsClueView(puzzle: crosshair, tileSize: 16.0).padding()
        ColumnsClueView(puzzle: dash, tileSize: 16.0).padding()
    }

}

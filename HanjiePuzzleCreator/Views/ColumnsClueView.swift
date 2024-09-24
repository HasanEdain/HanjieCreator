//
//  ColumnsClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct ColumnsClueView: View {
    @ObservedObject var puzzle: Puzzle
    @State var tileSize: CGFloat = 14

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

    VStack {
        ColumnsClueView(puzzle: fourDotPuzzle, tileSize: 14.0)
        ColumnsClueView(puzzle: letterXPuzzle, tileSize: 14.0)
        ColumnsClueView(puzzle: framedPuzzle, tileSize: 14.0)
    }

}

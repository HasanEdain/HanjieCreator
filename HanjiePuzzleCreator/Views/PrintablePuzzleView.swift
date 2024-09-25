    //
    //  PrintablePuzzleView.swift
    //  HanjiePuzzleCreator
    //
    //  Created by Hasan Edain on 9/24/24.
    //

import SwiftUI

struct PrintablePuzzleView: View {
    @EnvironmentObject var puzzle: Puzzle

    let isEmpty: Bool

    var body: some View {

        VStack (alignment: .trailing,spacing: 0)  {
            Text(name)
                .font(.title)
                .fontWeight(.bold)
                .frame(width: width)
            HStack (spacing: 0){
                RowsClueView()
                if isEmpty {
                    EmptyPuzzleView()
                } else {
                    PuzzleView()
                }
            }
            ColumnsClueView()
        }
    }


    var name: String {
        return "\(puzzle.name)"
    }

    var width: CGFloat {
        let puzzleWidth: CGFloat = CGFloat(puzzle.width)
        let shim: CGFloat = 1.35
        let tileSize: CGFloat = puzzle.tileSize

        let result = (puzzleWidth + shim) * tileSize
        
        return result
    }
}

#Preview {
    @Previewable @State var show:Bool = true
    let puzzle =  ExamplePuzzles.fourDots

    VStack {
        PrintablePuzzleView(isEmpty: false)
            .environmentObject(puzzle)
        PrintablePuzzleView(isEmpty: true)
            .environmentObject(puzzle)
    }.padding()
}

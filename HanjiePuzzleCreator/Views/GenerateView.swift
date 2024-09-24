//
//  GenerateView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct GenerateView: View {
    @State var showHints: Bool = false
    @StateObject var puzzle: Puzzle = Puzzle()

    var body: some View {
        HStack {
            Button("Toggle") {
                showHints.toggle()
            }.padding()
            VStack{
                VStack(alignment: .trailing,spacing: 0) {
                    Text("\(puzzle.name)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    HStack (spacing: 0){
                        if showHints {
                            RowsClueView(puzzle: puzzle)
                        }
                        PuzzleView(puzzle: puzzle)
                    }
                    if showHints {
                        ColumnsClueView(puzzle: puzzle)
                    }
                }
            }
        }
    }
}

#Preview {
    GenerateView()
}

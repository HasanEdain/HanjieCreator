//
//  GenerateView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct GenerateView: View {
    @ObservedObject var puzzle: Puzzle

    @State var showHints: Bool = false
    @State var saveCountString: String = "0"

    var body: some View {
        HStack {
            Form {
                Button("Toggle") {
                    showHints.toggle()
                }.padding()

                TextField(text: $puzzle.name) {
                    Label(
                        title: { Text("Name") },
                        icon: { Image(systemName: "doc.richtext") }
                    )
                }
                TextField(text: $saveCountString) {
                    Label(
                        title: { Text("Save Count") },
                        icon: { Image(systemName: "number") }
                    )
                }
                Button("Save") {
                    save()
                }.padding()
                Button("Load") {
                    load()
                }.padding()
            }.frame(width: 256)

            PrintablePuzzleView(showHints: $showHints, puzzle: puzzle).padding()
        }
    }

    func load() {
        var saveCount: Int = 0

        if let mySaveCount = Int(saveCountString) {
            saveCount = mySaveCount
        }

        let textString = "\(self.puzzle.name)_\(saveCount)_puzzle.json"
        if let safePuzzle = Puzzle.load(source: textString) {
            puzzle.name = safePuzzle.name
            puzzle.tileSize = safePuzzle.tileSize
            puzzle.puzzleTiles = safePuzzle.puzzleTiles
        } else {
            print("failed to load: \(textString)")
        }

    }

    @MainActor func save() {
        let rendererSolved = ImageRenderer(content: solvedPuzzleView)
        let redererPuzzle = ImageRenderer(content: puzzleView)

        var saveCount: Int = 0

        if let mySaveCount = Int(saveCountString) {
            saveCount = mySaveCount
        }

        let homeURL = FileManager.default.homeDirectoryForCurrentUser
        let solvedUrl = homeURL.appending(path: "Downloads/Hanjie/\(puzzle.name)_\(saveCount)_solved.pdf")
        let unsolvedUrl = homeURL.appending(path: "Downloads/Hanjie/\(puzzle.name)_\(saveCount)_puzzle.pdf")
        print("Solved PDF: \(solvedUrl.absoluteString)")

        let textString = "\(puzzle.name)_\(saveCount)_puzzle.json"
        puzzle.save(destination: textString)

        rendererSolved.render { size, renderInContext in
            var box = CGRect(
                origin: .zero,
                size: .init(width: CGFloat(puzzle.width) * puzzle.tileSize + 50.0, height: CGFloat(puzzle.height) * puzzle.tileSize + 80.0)
            )

            guard let context = CGContext(solvedUrl as CFURL, mediaBox: &box, nil) else {
                return
            }

            context.beginPDFPage(nil)
            renderInContext(context)
            context.endPage()
            context.closePDF()
        }

        redererPuzzle.render { size, renderInContext in
            var box = CGRect(
                origin: .zero,
                size: .init(width: CGFloat(puzzle.width) * puzzle.tileSize + 50.0, height: CGFloat(puzzle.height) * puzzle.tileSize + 80.0)
            )

            guard let context = CGContext(unsolvedUrl as CFURL, mediaBox: &box, nil) else {
                return
            }

            context.beginPDFPage(nil)
            renderInContext(context)
            context.endPage()
            context.closePDF()
        }

        saveCount = saveCount + 1
        self.saveCountString = String(saveCount)
    }

    @ViewBuilder var solvedPuzzleView: some View {
        PrintablePuzzleView(showHints:$showHints, puzzle: puzzle)
    }

    @ViewBuilder var puzzleView: some View {
        PrintablePuzzleView(showHints:$showHints, puzzle: puzzle, isEmpty: true)
    }
}

#Preview {
    let four = Puzzle.fourDots

    GenerateView(puzzle: four)
}

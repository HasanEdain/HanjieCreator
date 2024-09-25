//
//  Puzzle.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import Foundation
import Combine

class Puzzle: ObservableObject, Codable, Hashable, Equatable {
    @Published var puzzleTiles: PuzzleTiles
    @Published var tileSize: CGFloat
    @Published var name: String

    var cancelable: [AnyCancellable] = []

    init(width:Int = 10, height:Int = 10, size: CGFloat = 16.0, name: String = "Puzzle") {
        self.tileSize = size
        self.name = name
        self.puzzleTiles = PuzzleTiles(width: width, height: height)
        updateOnTap()
    }

    func updateOnTap() {
        puzzleTiles.tiles.forEach {tileLine in
            tileLine.tiles.forEach { tile in
                tile.$didTap.sink { _ in
                    tileLine.horizontalDisplayText = tileLine.horizontalString
                    tileLine.verticalDisplayText = tileLine.verticalString
                    print("vert: \(tileLine.verticalDisplayText) \(tileLine.verticalString)")

                }.store(in: &cancelable)
            }
        }
    }

    func update(color: TileColor, location: Location) {
        let tile = puzzleTiles.tile(at: location)
        tile.tileColor = color
    }

    //MARK: - Access
    func row(number: Int) -> TileLine {
        return puzzleTiles.row(number: number)
    }

    func column(number: Int) -> TileLine {
        return puzzleTiles.column(number: number)
    }

    var width: Int {
        return puzzleTiles.width
    }

    var height: Int {
        return puzzleTiles.height
    }

    //MARK: - Codable
    enum CodingKeys: CodingKey {
        case puzzleTiles
        case tileSize
        case name
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        puzzleTiles = try container.decode(PuzzleTiles.self, forKey: .puzzleTiles)
        tileSize = try container.decode(CGFloat.self, forKey: .tileSize)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(puzzleTiles, forKey: .puzzleTiles)
        try container.encode(tileSize, forKey: .tileSize)
        try container.encode(name, forKey: .name)
    }

    //MARK: - Equatable
    static func == (lhs: Puzzle, rhs: Puzzle) -> Bool {
        if lhs.puzzleTiles != rhs.puzzleTiles {
            return false
        }

        if lhs.tileSize != rhs.tileSize {
            return false
        }

        if lhs.name != rhs.name {
            return false
        }

        return true
    }

    //MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(puzzleTiles)
        hasher.combine(tileSize)
        hasher.combine(name)
    }

    //MARK: - Persistence
    func save(destination: String) {
            // get URL to the the documents directory in the sandbox
        let documentsUrl = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)[0] as NSURL

            // add a filename
        guard let fileUrl = documentsUrl.appendingPathComponent("Hanjie/\(destination)") else {
            print("Failed to create file url: \(destination)")
            return
        }

        print("save path: \(fileUrl.absoluteString)")

        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self)
            try data.write(to: fileUrl)
            print("File Written to: \(fileUrl.absoluteString)")
        } catch {
            print("\(error.localizedDescription)")
            return
        }
    }

    static func load(source: String) -> Puzzle? {
            // get URL to the the documents directory in the sandbox
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as NSURL

            // add a filename
        guard let fileUrl = documentsUrl.appendingPathComponent("\(source)") else {
            print("Failed to create file url: \(source)")
            return nil
        }

        do {
            if let data = Data.ReferenceType(contentsOf: fileUrl) {
                let decoder = JSONDecoder()
                let puzzle = try decoder.decode(Puzzle.self, from: data as Data)

                return puzzle
            }
        } catch {
            print("\(error.localizedDescription)")
            return nil
        }
        return nil
    }

    static var dash: Puzzle {
        let puz = Puzzle()

        puz.update(color: .primary, location: Location(x: 0, y: 2))
        puz.update(color: .primary, location: Location(x: 1, y: 2))
        puz.update(color: .primary, location: Location(x: 2, y: 2))
        puz.update(color: .primary, location: Location(x: 3, y: 2))
        puz.update(color: .primary, location: Location(x: 4, y: 2))
        puz.update(color: .primary, location: Location(x: 5, y: 2))
        puz.update(color: .primary, location: Location(x: 6, y: 2))
        puz.update(color: .primary, location: Location(x: 7, y: 2))
        puz.update(color: .primary, location: Location(x: 8, y: 2))
        puz.update(color: .primary, location: Location(x: 9, y: 2))

        return puz
    }

    static var fourDots: Puzzle {
        let puz = Puzzle()

        puz.update(color: .primary, location: Location(x: 2, y: 2))
        puz.update(color: .primary, location: Location(x: 3, y: 2))

        puz.update(color: .primary, location: Location(x: 2, y: 3))
        puz.update(color: .primary, location: Location(x: 3, y: 3))

        puz.update(color: .primary, location: Location(x: 7, y: 2))
        puz.update(color: .primary, location: Location(x: 8, y: 2))

        puz.update(color: .primary, location: Location(x: 7, y: 3))
        puz.update(color: .primary, location: Location(x: 8, y: 3))

        puz.update(color: .primary, location: Location(x: 2, y: 7))
        puz.update(color: .primary, location: Location(x: 3, y: 7))

        puz.update(color: .primary, location: Location(x: 2, y: 8))
        puz.update(color: .primary, location: Location(x: 3, y: 8))

        puz.update(color: .primary, location: Location(x: 7, y: 7))
        puz.update(color: .primary, location: Location(x: 8, y: 7))

        puz.update(color: .primary, location: Location(x: 7, y: 8))
        puz.update(color: .primary, location: Location(x: 8, y: 8))

        return puz
    }

    static var crosshair: Puzzle {
        let puz = Puzzle()

        puz.update(color: .primary, location: Location(x: 4, y: 0))
        puz.update(color: .primary, location: Location(x: 4, y: 1))
        puz.update(color: .primary, location: Location(x: 4, y: 2))
        puz.update(color: .primary, location: Location(x: 4, y: 3))
        puz.update(color: .primary, location: Location(x: 4, y: 4))
        puz.update(color: .primary, location: Location(x: 4, y: 5))
        puz.update(color: .primary, location: Location(x: 4, y: 6))
        puz.update(color: .primary, location: Location(x: 4, y: 7))
        puz.update(color: .primary, location: Location(x: 4, y: 8))
        puz.update(color: .primary, location: Location(x: 4, y: 9))

        puz.update(color: .primary, location: Location(x: 0, y: 4))
        puz.update(color: .primary, location: Location(x: 1, y: 4))
        puz.update(color: .primary, location: Location(x: 2, y: 4))
        puz.update(color: .primary, location: Location(x: 3, y: 4))
        puz.update(color: .primary, location: Location(x: 5, y: 4))
        puz.update(color: .primary, location: Location(x: 6, y: 4))
        puz.update(color: .primary, location: Location(x: 7, y: 4))
        puz.update(color: .primary, location: Location(x: 8, y: 4))
        puz.update(color: .primary, location: Location(x: 9, y: 4))


        return puz
    }

    static var letterX: Puzzle {
        let puz = Puzzle()

        puz.update(color: .primary, location: Location(x: 0, y: 0))
        puz.update(color: .primary, location: Location(x: 1, y: 1))
        puz.update(color: .primary, location: Location(x: 2, y: 2))
        puz.update(color: .primary, location: Location(x: 3, y: 3))
        puz.update(color: .primary, location: Location(x: 4, y: 4))
        puz.update(color: .primary, location: Location(x: 5, y: 5))
        puz.update(color: .primary, location: Location(x: 6, y: 6))
        puz.update(color: .primary, location: Location(x: 7, y: 7))
        puz.update(color: .primary, location: Location(x: 8, y: 8))
        puz.update(color: .primary, location: Location(x: 9, y: 9))

        puz.update(color: .primary, location: Location(x: 9, y: 0))
        puz.update(color: .primary, location: Location(x: 8, y: 1))
        puz.update(color: .primary, location: Location(x: 7, y: 2))
        puz.update(color: .primary, location: Location(x: 6, y: 3))
        puz.update(color: .primary, location: Location(x: 5, y: 4))
        puz.update(color: .primary, location: Location(x: 4, y: 5))
        puz.update(color: .primary, location: Location(x: 3, y: 6))
        puz.update(color: .primary, location: Location(x: 2, y: 7))
        puz.update(color: .primary, location: Location(x: 1, y: 8))
        puz.update(color: .primary, location: Location(x: 0, y: 9))

        return puz
    }

    static var framed: Puzzle {
        let puz = Puzzle()

        puz.update(color: .primary, location: Location(x: 0, y: 0))
        puz.update(color: .primary, location: Location(x: 1, y: 0))
        puz.update(color: .primary, location: Location(x: 2, y: 0))
        puz.update(color: .primary, location: Location(x: 3, y: 0))
        puz.update(color: .primary, location: Location(x: 4, y: 0))
        puz.update(color: .primary, location: Location(x: 5, y: 0))
        puz.update(color: .primary, location: Location(x: 6, y: 0))
        puz.update(color: .primary, location: Location(x: 7, y: 0))
        puz.update(color: .primary, location: Location(x: 8, y: 0))
        puz.update(color: .primary, location: Location(x: 9, y: 0))

        puz.update(color: .primary, location: Location(x: 0, y: 9))
        puz.update(color: .primary, location: Location(x: 1, y: 9))
        puz.update(color: .primary, location: Location(x: 2, y: 9))
        puz.update(color: .primary, location: Location(x: 3, y: 9))
        puz.update(color: .primary, location: Location(x: 4, y: 9))
        puz.update(color: .primary, location: Location(x: 5, y: 9))
        puz.update(color: .primary, location: Location(x: 6, y: 9))
        puz.update(color: .primary, location: Location(x: 7, y: 9))
        puz.update(color: .primary, location: Location(x: 8, y: 9))
        puz.update(color: .primary, location: Location(x: 9, y: 9))

        puz.update(color: .primary, location: Location(x: 0, y: 1))
        puz.update(color: .primary, location: Location(x: 0, y: 2))
        puz.update(color: .primary, location: Location(x: 0, y: 3))
        puz.update(color: .primary, location: Location(x: 0, y: 4))
        puz.update(color: .primary, location: Location(x: 0, y: 5))
        puz.update(color: .primary, location: Location(x: 0, y: 6))
        puz.update(color: .primary, location: Location(x: 0, y: 7))
        puz.update(color: .primary, location: Location(x: 0, y: 8))

        puz.update(color: .primary, location: Location(x: 9, y: 1))
        puz.update(color: .primary, location: Location(x: 9, y: 2))
        puz.update(color: .primary, location: Location(x: 9, y: 3))
        puz.update(color: .primary, location: Location(x: 9, y: 4))
        puz.update(color: .primary, location: Location(x: 9, y: 5))
        puz.update(color: .primary, location: Location(x: 9, y: 6))
        puz.update(color: .primary, location: Location(x: 9, y: 7))
        puz.update(color: .primary, location: Location(x: 9, y: 8))

        return puz
    }
}

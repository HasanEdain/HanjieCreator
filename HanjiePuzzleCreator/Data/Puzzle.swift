//
//  Puzzle.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import Foundation

class Puzzle: ObservableObject, Codable, Hashable, Equatable {
    @Published var tiles: [[Tile]] = []
    @Published var width: Int = 10
    @Published var height: Int = 10
    @Published var tileSize: CGFloat = 14.0
    @Published var name: String = "Puzzle"

    init(width:Int = 10, height:Int = 10, size: CGFloat = 14.0) {
        for yIndex in 0..<height {
            tiles.append([Tile]())
            for _ in 0..<width {
                tiles[yIndex].append(Tile())
            }
        }
        self.width = width
        self.height = height
        self.tileSize = size
    }

    func update(color: TileColor, location: Location) {
        let tile = tile(at: location)
        tile.tileColor = color
    }

    func tile(at location: Location) -> Tile {
        let tile = tiles[location.y][location.x]

        return tile
    }

    func row(number: Int) -> TileLine {
        return TileLine(tiles: tiles[number])
    }

    func column(number: Int) -> TileLine {
        var lineTiles: [Tile] = []

        for index in 0..<height {
            let tile = tiles[index][number]
            lineTiles.append(tile)
        }

        return TileLine(tiles: lineTiles)
    }

    //MARK: - Codable
    enum CodingKeys: CodingKey {
        case tiles
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tiles = try container.decode([[Tile]].self, forKey: .tiles)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tiles, forKey: .tiles)
    }

    //MARK: - Equatable
    static func == (lhs: Puzzle, rhs: Puzzle) -> Bool {
        for yIndex in lhs.tiles.indices {
            for xIndex in lhs.tiles.indices {
                let rhsValue = rhs.tiles[yIndex][xIndex]
                let lhsValue = lhs.tiles[yIndex][xIndex]
                if rhsValue != lhsValue {
                    return false
                }
            }
        }
        
        return true
    }

    //MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(tiles)
    }

    //MARK: - Persistence
    func save(destination: String) {
            // get URL to the the documents directory in the sandbox
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as NSURL

            // add a filename
        guard let fileUrl = documentsUrl.appendingPathComponent("\(destination).txt") else {
            print("Failed to create file url: \(destination).txt")
            return
        }

        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self)
            try data.write(to: fileUrl)
        } catch {
            print("\(error.localizedDescription)")
            return
        }
    }

    static func load(source: String) -> Puzzle? {
            // get URL to the the documents directory in the sandbox
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as NSURL

            // add a filename
        guard let fileUrl = documentsUrl.appendingPathComponent("\(source).txt") else {
            print("Failed to create file url: \(source).txt")
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

//
//  PuzzleTiles.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/24/24.
//

import Foundation

class PuzzleTiles:ObservableObject, Codable, Equatable, Hashable {
    @Published var tiles: [TileLine] = []
    @Published var width: Int
    @Published var height: Int

    //MARK: - Init
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        
        for _ in 0..<height {
            var tempTiles = [Tile]()
            for _ in 0..<width {
                tempTiles.append(Tile())
            }
            tiles.append(TileLine(tiles: tempTiles))
        }
    }

    //MARK: - Access
    func tile(at location: Location) -> Tile {
        let tileLine = tiles[location.y]
        let tile = tileLine.tiles[location.x]

        return tile
    }

    func row(number: Int) -> TileLine {
        return tiles[number]
    }

    func column(number: Int) -> TileLine {
        var lineTiles: [Tile] = []

        for index in 0..<height {
            let tile = tile(at: Location(x: number, y: index))
            lineTiles.append(tile)
        }

        return TileLine(tiles: lineTiles)
    }

        //MARK: - Codable
    enum CodingKeys: CodingKey {
        case tiles
        case width
        case height
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tiles = try container.decode([TileLine].self, forKey: .tiles)
        width = try container.decode(Int.self, forKey: .width)
        height = try container.decode(Int.self, forKey: .height)
        }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tiles, forKey: .tiles)
        try container.encode(width, forKey: .width)
        try container.encode(height, forKey: .height)
        }

        //MARK: - Equatable
    static func == (lhs: PuzzleTiles, rhs: PuzzleTiles) -> Bool {
        for yIndex in lhs.tiles.indices {
            for xIndex in lhs.tiles.indices {
                let rhsValue = rhs.tiles[yIndex].tile(at: xIndex)
                let lhsValue = lhs.tiles[yIndex].tile(at: xIndex)
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
        hasher.combine(width)
        hasher.combine(height)
    }
}

//
//  TileLine.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import Foundation

class TileLine: ObservableObject, Codable, Hashable, Identifiable {
    @Published var tiles: [Tile]
    @Published var horizontalDisplayText: String = ""
    @Published var verticalDisplayText: String = ""
    let id: UUID

    init(tiles: [Tile], id: UUID = UUID()) {
        self.tiles = tiles
        self.id = id

        horizontalDisplayText = horizontalString
        verticalDisplayText = verticalString
    }

        //MARK: - Codable
    enum CodingKeys: CodingKey {
        case tiles
        case id
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tiles = try container.decode([Tile].self, forKey: .tiles)
        id = try container.decode(UUID.self,forKey: .id)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(tiles, forKey: .tiles)
        try container.encode(id, forKey: .id)
    }

        //MARK: - Equatable
    static func == (lhs: TileLine, rhs: TileLine) -> Bool {
        for xIndex in lhs.tiles.indices {
            let rhsValue = rhs.tile(at: xIndex)
            let lhsValue = lhs.tile(at: xIndex)
            if rhsValue != lhsValue {
                return false
            }
        }

        return true
    }

        //MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(tiles)
        hasher.combine(id)
    }

    //MARK: - Access
    func clear() {
        tiles.forEach { tile in
            tile.clear()
        }
    }

    func tile(at index: Int) -> Tile {
        return tiles[index]
    }

    var countArray: CountArray {
        let array = CountArray()

        var onCount: Int = 0
        var currentIndex = 0
        tiles.forEach { tile in
            if tile.isOn {
                onCount = onCount + 1
            } else {
                if onCount > 0 {
                    array.counts.append(onCount)
                    onCount = 0
                }
            }

            currentIndex = currentIndex + 1
        }

        if onCount > 0 && array.counts.isEmpty {
            array.counts.append(onCount)
        }

        return array
    }

    func stringSize(tileSize: CGFloat) -> CGFloat {
        let str = horizontalString
        let len = str.count

        let floatLen = CGFloat(len)
        let size = tileSize * floatLen

        return size
    }

    var horizontalString: String {
        let array = countArray.counts

        var result = ""
        var index: Int = 0
        array.forEach { count in
            if index > 0 {
                result.append(" ")
            }
            if count > 0 {
                result.append("\(count)")
            }
            index = index + 1
        }

        return result
    }

    var verticalString: String {
        let array = countArray.counts

        var result = ""
        var index: Int = 0
        array.forEach { count in
            if count > 0 {
                result.append("\(count)")
            }
            if index < array.count - 1 {
                result.append("\n")
            }
            index = index + 1
        }

        return result
    }
}

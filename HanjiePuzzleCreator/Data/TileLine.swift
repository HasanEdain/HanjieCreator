//
//  TileLine.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import Foundation

class TileLine: ObservableObject {
    @Published var tiles: [Tile]

    init(tiles: [Tile]) {
        self.tiles = tiles
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

    var verticalSting: String {
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

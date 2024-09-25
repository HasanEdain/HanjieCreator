//
//  Location.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//


import Foundation

class Location: CustomDebugStringConvertible, Comparable, Identifiable, ObservableObject {
    @Published var x: Int
    @Published var y: Int
    @Published var id: UUID

    init(x: Int, y: Int, id: UUID = UUID()) {
        self.x = x
        self.y = y
        self.id = id
    }

    static func == (lhs: Location, rhs: Location) -> Bool {
        if lhs.x != rhs.x {
            return false
        }

        if lhs.y != rhs.y {
            return false
        }

        return true
    }

    static func < (lhs: Location, rhs: Location) -> Bool {
        if lhs.x < rhs.x {
            return true
        }
        if lhs.y < rhs.y {
            return true
        }

        return false
    }

    func isInvalidLocation() -> Bool {
        if x < 0 {
            return true
        } else if y < 0 {
            return true
        }

        return false
    }

    static var invalid: Location {
        return Location(x: -1, y: -1)
    }

    var debugDescription: String {
        return String("(x: \(x) y:\(y))")
    }
}

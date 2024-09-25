//
//  TileColor.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import Foundation
import SwiftUI

enum TileColor:Int, Codable, Equatable, Hashable, Comparable, CustomDebugStringConvertible {
    case empty = 0
    case primary = 1
    case second = 2
    case third = 3
    case fourth = 4
    case fifth = 5
    case sixth = 6
    case seventh = 7
    case eighth = 8
    case ninth = 9

    var debugDescription: String {
        switch self {
            case .empty:
                return "Empty"
            case .primary:
                return "Primary"
            case .second:
                return "Secondary"
            case .third:
                return "Tertiary"
            case .fourth:
                return "Fourth"
            case .fifth:
                return "Fifth"
            case .sixth:
                return "Sixth"
            case .seventh:
                return "Seventh"
            case .eighth:
                return "Eigth"
            case .ninth:
                return "Ninth"
        }
    }

    var color: Color {
        switch self {
            case .empty:
                return .white
            case .primary:
                return .black
            case .second:
                return .blue
            case .third:
                return .green
            case .fourth:
                return .gray
            case .fifth:
                return .brown
            case .sixth:
                return .red
            case .seventh:
                return .yellow
            case .eighth:
                return .orange
            case .ninth:
                return .purple
        }
    }

    //MARK: - Comparible
    static func < (lhs: TileColor, rhs: TileColor) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

}

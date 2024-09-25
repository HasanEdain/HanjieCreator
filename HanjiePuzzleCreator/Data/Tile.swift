//
//  Tile.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import Foundation
import SwiftUICore


class Tile: ObservableObject, Identifiable, Hashable, Equatable, Codable {
    @Published var id: UUID
    @Published var tileColor: TileColor
    @Published var didTap: Bool = false

    //MARK: - Init
    init(id: UUID = UUID(), tileColor: TileColor = .empty) {
        self.id = id
        self.tileColor = tileColor
    }

    //MARK: state
    func clear() {
        tileColor = .empty
    }
    func toggle() {
        if tileColor == .empty {
            tileColor = .primary
        } else {
            tileColor = .empty
        }
        didTap.toggle()
    }

    var isOn: Bool {
        return tileColor != .empty
    }

    //MARK: - Codable
    enum CodingKeys: CodingKey {
        case id
        case tileColor
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        tileColor = try container.decode(TileColor.self, forKey: .tileColor)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(tileColor, forKey: .tileColor)
    }

    //MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(tileColor)
    }

    //MARK: - Equatable
    static func == (lhs: Tile, rhs: Tile) -> Bool {
        return lhs.tileColor == rhs.tileColor
    }
}

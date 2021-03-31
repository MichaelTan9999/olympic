//
//  Game.swift
//  olympic
//
//  Created by Michael Tan on 2021/3/30.
//

import Foundation

struct Game: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var icon: String
    var athlete: String
    var brief: String
    var detail: [DetailContent]
    
    struct DetailContent: Hashable, Codable, Identifiable {
        var id: Int
        var title: String
        var content: String
    }
}

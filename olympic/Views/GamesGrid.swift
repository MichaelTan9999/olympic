//
//  EventsGrid.swift
//  olympic
//
//  Created by Michael Tan on 2021/3/26.
//

import SwiftUI

struct GamesGrid: View {
    let games: [Game] = ModelData().games
    
    var body: some View {
        NavigationView {
            ScrollView (.vertical) {
                LazyVGrid (columns: Array(repeating: GridItem(), count: 4), spacing: 20) {
                    ForEach(games) { game in
                        NavigationLink (destination: GameDetail(game: game)) {
                            GameItem(game: game)
                        }
                    }
                }
                .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
            }
            .navigationTitle("Games")
        }
    }
}

struct GameItem: View {
    let game: Game
    var body: some View {
        VStack {
            Image(game.icon).resizable().frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct GamesGrid_Previews: PreviewProvider {
    static var previews: some View {
        GamesGrid()
    }
}

//
//  Home.swift
//  olympic
//
//  Created by Michael Tan on 2021/3/26.
//

import SwiftUI

struct Home: View {
    let games: [Game] = ModelData().games
    var todayRecommendSportId = Int(Date().timeIntervalSince1970 / (3600 * 24)) % ModelData().games.count
    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
                MapView().frame(height: 400).ignoresSafeArea(edges: .top).padding(.bottom, -140)
                Text("Paris 2024").bold()
                ScrollView {
                    HStack {
                        Image("olympicRings").resizable().aspectRatio(contentMode: .fit).frame(width: 150)
                        Divider()
                        Image("flagFrance").resizable().aspectRatio(contentMode: .fit).frame(width: 150)
                    }.frame(height: 120)
                    NavigationLink (destination: GameDetail(game: games[todayRecommendSportId])) {
                        HStack {
                            VStack (alignment: .leading, spacing: 20) {
                                Text("Today's sport").font(.headline)
                                Text(games[todayRecommendSportId].name).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            }
                            Spacer()
                            Image(games[todayRecommendSportId].icon).resizable().frame(width: 90, height: 90)
                        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    }
                    HStack {
                        Text(games[todayRecommendSportId].brief)
                    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    Spacer()
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

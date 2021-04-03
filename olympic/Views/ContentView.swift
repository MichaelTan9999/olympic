//
//  ContentView.swift
//  olympic
//
//  Created by Michael Tan on 2021/3/26.
//

import SwiftUI

struct ContentView: View {
    var games: [Game]
    @State private var selectedTab: Tabs = .home
    
    enum Tabs {
        case home
        case games
        case countdown
        case about
    }
    
    var body: some View {
        TabView(selection: $selectedTab,
                content:  {
                    Home().tabItem {
                        Label("Home", systemImage: "house")
                    }.tag(Tabs.home)
                    GamesGrid(games: games).tabItem {
                        Label("Games", systemImage: "sportscourt")
                    }.tag(Tabs.games)
                    Countdown().tabItem {
                        Label("Countdown", systemImage: "stopwatch")
                    }.tag(Tabs.countdown)
                    About().tabItem {
                        Label("About", systemImage: "info.circle")
                    }.tag(Tabs.about)
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(games: ModelData().games)
    }
}

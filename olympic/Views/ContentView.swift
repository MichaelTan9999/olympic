//
//  ContentView.swift
//  olympic
//
//  Created by Michael Tan on 2021/3/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var games: [Game]
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Sport.entity(), sortDescriptors: [])

    var favoriteSports: FetchedResults<Sport>
    
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
                        Label("Home\(favoriteSports.count)", systemImage: "house")
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
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

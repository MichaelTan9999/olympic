//
//  olympicApp.swift
//  olympic
//
//  Created by Michael Tan on 2021/3/26.
//

import SwiftUI

@main
struct olympicApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView(games: ModelData().games).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

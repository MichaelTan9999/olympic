//
//  Favorites.swift
//  olympic
//
//  Created by Michael Tan on 2021/4/6.
//

import Foundation

class Favorites: ObservableObject {
    private var tasks: Set<Int>
    let defaults = UserDefaults.standard
    
    init() {
        let decoder = JSONDecoder()
        if let data = defaults.value(forKey: "Favorites") as? Data {
            let taskData = try? decoder.decode(Set<Int>.self, from: data)
            self.tasks = taskData ?? []
        } else {
            self.tasks = []
        }
    }
    
    func getTasks() -> Set<Int> {
        return self.tasks
    }
    
    func contains(id: Int) -> Bool {
        return tasks.contains(id)
    }
    
    func add(id: Int) {
        objectWillChange.send()
        tasks.insert(id)
        save()
    }
    
    func remove(id: Int) {
        objectWillChange.send()
        tasks.remove(id)
        save()
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks) {
            defaults.set(encoded, forKey: "Favorites")
        }
    }
}

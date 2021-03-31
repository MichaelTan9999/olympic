//
//  Countdown.swift
//  olympic
//
//  Created by Michael Tan on 2021/3/26.
//

import SwiftUI
import Foundation


func getInterval () -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let startDateTimeString = "2024-07-24 18:20:00"
    let startDateTime = dateFormatter.date(from: startDateTimeString)!
    let interval = DateInterval(start: Date(), end: startDateTime)
    return interval.description
}


struct Countdown: View {
    @State private var now = Date()
    
    let startDateTime = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        NavigationView {
            Text("\(now)").onReceive(timer, perform: { input in
                now = input
            })
            .navigationTitle("Countdown")        }
    }
}

struct Countdown_Previews: PreviewProvider {
    static var previews: some View {
        Countdown()
    }
}

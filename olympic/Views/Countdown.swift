//
//  Countdown.swift
//  olympic
//
//  Created by Michael Tan on 2021/3/26.
//

import SwiftUI
import Foundation



struct Countdown: View {
    @State private var now = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        NavigationView {
            VStack {
                Image("logoParis2024")
                Text("Time left").font(.title).padding()
                Text("\(getInterval(start: now).day!) days\n\(getInterval(start: now).hour!) hours\n\(getInterval(start: now).minute!) minutes\n\(getInterval(start: now).second!) seconds").font(.title2).onReceive(timer, perform: { input in
                    now = input
                })
                
            }
            .navigationTitle("Countdown")
        }
    }
    
    func getInterval(start: Date) -> DateComponents {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar.current
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
        let startDate = dateFormatter.date(from: "2024-07-24 16:00")
        let interval = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: start, to: startDate!)
        return interval
    }
}

struct Countdown_Previews: PreviewProvider {
    static var previews: some View {
        Countdown()
    }
}


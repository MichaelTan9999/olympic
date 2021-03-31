//
//  About.swift
//  olympic
//
//  Created by Michael Tan on 2021/3/26.
//

import SwiftUI

struct About: View {
    
    let paragraphPaddingStyle = EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
    let labelPaddingStyle = EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)

    var body: some View {
        NavigationView {
            VStack {
                Image("logoUESTC").resizable().aspectRatio(contentMode: .fit)
                Image("mottoUESTC").resizable().aspectRatio(contentMode: .fit)
                Text("This work is based on the requirement of Comprehensive Design Course of the SISE of UESTC.").padding(paragraphPaddingStyle)
                Text("As the author, I strongly suggest you write the names of your teammates and an acknowledgement for your supervisor on this simple project.").padding(paragraphPaddingStyle)
                Divider().padding()
                HStack {
                    Image(systemName: "person")
                    Text("Michael Tan")
                }.padding(labelPaddingStyle)
                HStack {
                    Image(systemName: "envelope")
                    Text("thr205@hotmail.com")
                }.padding(labelPaddingStyle)
                HStack {
                    Image(systemName: "swift")
                    Text("A Swift and Swift UI project")
                }.padding(labelPaddingStyle)
            }.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            .navigationTitle("About")
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}

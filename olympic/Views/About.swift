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
            ScrollView {
                VStack {
                    Image("logoUESTC").resizable().aspectRatio(contentMode: .fit).frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Image("mottoUESTC").resizable().aspectRatio(contentMode: .fit)
                    Text("This work is based on the requirement of Comprehensive Design Course - \"Design and Implementation of a Olympic Introducing App with Swift based on iOS\", of which the instructor is Yue Feng, of the School of Information and Software Engineering of University of Electronic Science and Technology of China.").padding(paragraphPaddingStyle).fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Text("As the author, I strongly suggest you write the names of your teammates and an acknowledgement for your supervisor on this simple project.").padding(paragraphPaddingStyle).fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Text("The reason that I make this project is that I want to help those who chooses the same topic like me for the Comprehensive Design Course. When I chose the project for my first Comprehensive Design Course, I did not have a skill stack and thus I found it extremely difficult. Considering that you may also encounter the problem I met and the development of Swift and iOS app architecture is really superfast, I decide to make an app for you, for saving your time on understanding the swift and the structure of the apps.").padding(paragraphPaddingStyle).fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Divider().padding()
                    HStack {
                        Image(systemName: "person")
                        Text("Michael Tan")
                    }.padding(labelPaddingStyle)
                    HStack {
                        Image(systemName: "envelope")
                        Text("thr205@michaeltan.org")
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
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}

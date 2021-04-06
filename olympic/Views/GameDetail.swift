//
//  GameDetail.swift
//  olympic
//
//  Created by Michael Tan on 2021/3/28.
//

import SwiftUI

struct GameDetail: View {
    var game: Game

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Sport.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Sport.sportIndex, ascending: true)
    ])

    var favoriteSports: FetchedResults<Sport>
    
    
    let chapterTitlePadding: EdgeInsets = EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        @State var isFavorite: Bool = false
    
    var body: some View {

        ScrollView (.vertical) {
                VStack {
                    Image(game.athlete).resizable().aspectRatio(contentMode: .fit)
                    HStack {
                        Image(game.icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .shadow(radius: 7)
                        Text(game.name).fontWeight(.black)
                        Spacer()
                        Button(action: {
                            isFavorite = !isFavorite
                        }, label: {
                            Image(systemName: isFavorite ? "star.fill" : "star" ).foregroundColor(.yellow)
                        }).padding()
                    }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    ForEach(favoriteSports) { sport in
                        Text("\(sport.sportIndex)")
                    }
                    VStack (alignment: .leading) {
                        Text(game.brief)
                            .foregroundColor(.gray)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        ForEach(game.detail) { paragraph in
                            Text(paragraph.title)
                                .bold()
                                .padding(chapterTitlePadding)
                            Text(paragraph.content).fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        }
                    }.padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                    Spacer()
                }
                .navigationTitle(game.name)
            }
    }
}

struct GameDetail_Previews: PreviewProvider {
    static var previews: some View {
        GameDetail(game: ModelData().games[0])
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

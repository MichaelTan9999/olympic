//
//  GameDetail.swift
//  olympic
//
//  Created by Michael Tan on 2021/3/28.
//

import SwiftUI

let chapterTitlePadding : EdgeInsets = EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)

struct GameDetail: View {
    var game: Game
    
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
                    }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    VStack (alignment: .leading) {
                        Text(game.brief)
                            .foregroundColor(.gray)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        ForEach(game.detail) {paragraph in
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
        Group {
            GameDetail(game: ModelData().games[0])
            GameDetail(game: ModelData().games[2])
        }
    }
}

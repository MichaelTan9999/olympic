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
    @ObservedObject var favorites = Favorites()
    @State var isFavorite: Bool = false
    @State var isShowFavoriteToast: Bool = false
    @State var isShowUnfavoriteToast: Bool = false
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
                            if(favorites.contains(id: game.id)) {
                                isShowUnfavoriteToast = true
                                favorites.remove(id: game.id)
                            } else {
                                isShowFavoriteToast = true
                                favorites.add(id: game.id)
                            }
                        }) {
                            Image(systemName: favorites.contains(id: game.id) ? "star.fill" : "star").foregroundColor(.yellow)
                        }.padding()
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
        .overlay(overlayView: Toast.init(dataModel: Toast.ToastDataModel.init(title: "Favorite", image: "bookmark", iconColor: Color.yellow), show: $isShowFavoriteToast), show: $isShowFavoriteToast)
        .overlay(overlayView: Toast.init(dataModel: Toast.ToastDataModel.init(title: "Unfavorite", image: "bookmark.slash", iconColor: Color.yellow), show: $isShowUnfavoriteToast), show: $isShowUnfavoriteToast)
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

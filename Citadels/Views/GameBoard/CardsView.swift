//
//  CardsView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/9/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct CardsView: View {
    @EnvironmentObject var GM: GameManager
    let playerID:Int
    var body: some View {
        GeometryReader{geo in
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<self.GM.PlayerList[self.playerID].Hand.count, id: \.self){i in
                        Image(self.GM.PlayerList[self.playerID].Hand[i].Name)
                            .resizable()
                            .frame(width: geo.size.width*3/10, height: geo.size.width*5/10)
                            .shadow(radius: 5)
                            .overlay(Rectangle().stroke(lineWidth: 3).foregroundColor(.black).shadow(radius: 5).blur(radius: 0.5))
                            .padding(geo.size.height/15)
                            // for playing a card
                            .contextMenu{
                                Button(action: {
                                    self.GM.PlayerList[self.playerID].Hand[i].currentState = 2
                                    self.GM.draggedCard = DraggedCard(card: self.GM.PlayerList[self.playerID].Hand[i])
                                    self.GM.PlayerList[self.playerID].Hand.remove(at: i)
                                    self.GM.PlayerList[self.playerID].Estate.insert(self.GM.draggedCard!.card, at: 0)
                                    self.GM.draggedCard = nil;
                                }) {
                                    Text("Build")
                                    Image(systemName: "house")
                                }
                            }
                    }
                }
            }.animation(.easeInOut)
        }
    }
}

//struct CardsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardsView(playerID: 0).frame(width: 400, height: 200)
//    }
//}

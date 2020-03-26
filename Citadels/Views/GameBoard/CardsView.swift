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
                            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                .onChanged({ value in
                                    
                                })
                                .onEnded({ value in
                                    
                                })
                        )
                    }
                }
            }
        }
    }
}

//struct CardsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardsView(playerID: 0).frame(width: 400, height: 200)
//    }
//}

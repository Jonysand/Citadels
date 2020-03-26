//
//  eachOpponentView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/24/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct EachOpponentView: View {
    @EnvironmentObject var GM: GameManager
    let playerID:Int
    
    var body: some View {
        GeometryReader{geo in
            ZStack{
                Image("EachOpponentBG")
                    .resizable()
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .overlay(Rectangle().stroke(lineWidth: 2).shadow(radius: 5, x: -5, y: -5).blur(radius: 1))
                VStack{
                    StatusView(playerID: 0)
                        .frame(width: 100, height: 120)
                    Divider()
                    CharacterView(playerID: self.playerID)
                    Divider()
                    EstateView(playerID: self.playerID)
                }
            }
        }
    }
}

//struct eachOpponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        EachOpponentView(playerID: 0)
//    }
//}

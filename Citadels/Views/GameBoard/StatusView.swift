//
//  StatusView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/19/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct StatusView: View {
    @EnvironmentObject var GM: GameManager
    let playerID:Int
    var body: some View {
        GeometryReader{ geo in
            VStack{
                // portrait
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: geo.size.width*2/5, height: geo.size.width*2/5)
                    .padding()
                // wealth
                HStack{
                    Image("coin")
                        .resizable()
                        .frame(width: geo.size.width/3, height: geo.size.width/3)
                        .overlay(Circle().stroke(lineWidth: 1).foregroundColor(.black))
                        .shadow(radius: 5)
                    Text("\(self.GM.PlayerList[self.playerID].Wealth)")
                        .font(.custom("Albertus Medium", size: 24))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(playerID: 0)
    }
}

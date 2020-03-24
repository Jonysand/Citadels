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
                Circle()
                    .frame(width: geo.size.width*2/3, height: geo.size.height*2/3)
                // wealth
                HStack{
                    Image(systemName: "dollarsign.circle.fill")
                        .resizable()
                        .frame(width: geo.size.width/3, height: geo.size.width/3)
                    Text("\(self.GM.PlayerList[self.playerID].Wealth)")
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

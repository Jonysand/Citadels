//
//  EstateView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/19/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct EstateView: View {
    @EnvironmentObject var GM: GameManager
    let playerID:Int
    var body: some View {
        GeometryReader{geo in
            ScrollView(.horizontal){
                HStack{
                    ForEach(0...self.GM.PlayerList[self.playerID].Estate.count, id: \.self){_ in
                        Circle()
                            .frame(width: geo.size.width*5/12)
                            .padding(geo.size.height/15)
                        }
                }
            }
        }
    }
}

struct EstateView_Previews: PreviewProvider {
    static var previews: some View {
        EstateView(playerID: 0)
    }
}

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
                    ForEach(0...self.GM.PlayerList[self.playerID].Hand.count, id: \.self){_ in
                        Rectangle()
                            .frame(width: geo.size.width*5/12)
                            .padding(geo.size.height/15)
                    }
                }
            }
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView(playerID: 0).frame(width: 400, height: 200)
    }
}

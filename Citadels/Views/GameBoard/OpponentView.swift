//
//  OpponentView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/19/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct OpponentView: View {
    @EnvironmentObject var GM:GameManager
    var body: some View {
        GeometryReader{geo in
            ScrollView(.horizontal){
                HStack{
                    ForEach(self.GM.PlayerList[1...], id: \.self){player in
                        EachOpponentView(playerID: player.id)
                        .frame(width: 150)
                            .padding()
                    }
                }
            }
            .frame(height: 400)
            .animation(.easeInOut)
        }
    }
    
}

//struct OpponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        OpponentView()
//    }
//}

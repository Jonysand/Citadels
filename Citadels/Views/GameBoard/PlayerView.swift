//
//  PlayerView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/19/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct PlayerView: View {
    var body: some View {
        HStack{
            VStack{
                // Status
                StatusView()
                // Role
                CharacterView()
                    .frame(width: 100, height: 250)
            }
            Divider()
            VStack{
                // Estate
                EstateView()
                Divider()
                // Hand
                CardsView()
            }
        }.frame(width: 400, height: 400)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView().frame(width: 400, height: 400)
    }
}

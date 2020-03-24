//
//  GameboardView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/19/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct GameboardView: View {
    @EnvironmentObject var GM:GameManager
    var body: some View {
        VStack{
            OpponentView()
            Divider()
            PlayerView()
        }
    }
}

struct GameboardView_Previews: PreviewProvider {
    static var previews: some View {
        GameboardView()
    }
}

//
//  CharacterView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/19/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct CharacterView: View {
    @EnvironmentObject var GM: GameManager
    let playerID:Int
    var body: some View {
        Image("\(self.GM.PlayerList[self.playerID].Role.Name)")
            .resizable()
            .frame(width: 90, height: 90)
            .overlay(Circle().stroke(lineWidth: 2).foregroundColor(.gray))
            .shadow(radius: 5)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(playerID: 0).frame(width: 100, height: 250)
    }
}

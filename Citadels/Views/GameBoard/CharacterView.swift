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
        GeometryReader{geo in
            VStack{
                // Character image
                Image("\(self.GM.PlayerList[self.playerID].Role.Name)")
                    .resizable()
                    .frame(width: geo.size.width, height: geo.size.width)
                    .overlay(Circle().stroke(lineWidth: 2).foregroundColor(.black))
                    .shadow(radius: 5)
                
                Spacer()
                
                // skill button
                Button(action:{
                    
                }){
                    ZStack{
                        Ellipse()
                            .frame(height: 50)
                        Text("Skill")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(playerID: 0).frame(width: 100, height: 250)
    }
}

//
//  PlayerView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/19/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var GM:GameManager
    var body: some View {
        HStack{
            VStack{
                // Status
                StatusView(playerID: 0)
                    .frame(width: 100, height: 130)
                // Role
                CharacterView(playerID: 0)
                // skill button
                Button(action:{
                    
                }){
                    ZStack{
                        Ellipse()
                            .frame(height: 50)
                            .foregroundColor(Color("SkillButton"))
                            .shadow(radius: 4)
                        Ellipse()
                            .fill(RadialGradient(gradient: Gradient(colors: [Color("SkillButton"), .black]), center: .center, startRadius: 0, endRadius: 360))
                            .frame(width: 90, height: 40)
                            .shadow(radius: 4)
                        Text("Skill")
                            .font(.custom("Albertus Medium", size: 24))
                            .foregroundColor(.black)
                        
                    }
                }.overlay(Ellipse().stroke(lineWidth: 2).foregroundColor(.black).shadow(color: .black, radius: 1).blur(radius: 1))
                    .frame(width: 90)
                    .padding()
                Spacer()
            }
            Divider()
            VStack{
                // Estate
                EstateView(playerID: 0)
                    .padding(8)
                Divider()
                // Hand
                CardsView(playerID: 0)
            }
        }.frame(height: 300)
    }
}

//struct PlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerView().frame(width: 400, height: 400)
//    }
//}

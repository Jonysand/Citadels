//
//  GameAlert.swift
//  Citadels
//
//  Created by Yongkun Li on 4/14/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct GameAlert: View {
    @EnvironmentObject var GM:GameManager
    
    var body: some View {
        VStack{
            ZStack{
                Text(verbatim: self.GM.KingIndex == 0 ? "You are the King":"Player \(GM.KingIndex) is the King!")
                    .opacity(self.GM.GameState==0 ? 1:0)
                PickCharactersView()
                    .opacity(self.GM.GameState==1 ? 1:0)
            }
            .font(.custom("Albertus Medium", size: 24))
            .foregroundColor(.black)
            .padding()
            
            // dismiss button
            HStack {
                Button(action: {
                    self.GM.showAlert = false
                    switch self.GM.GameState{
                        case 0:
                            self.GM.GameState = 1
                            break
                        case 1:
                            self.GM.GameState = 2
                            break
                        default:
                            break
                    }
                }) {
                    ZStack{
                        Ellipse()
                            .frame(width:100, height: 50)
                            .foregroundColor(Color("SkillButton"))
                            .shadow(radius: 4)
                        Ellipse()
                            .fill(RadialGradient(gradient: Gradient(colors: [Color("SkillButton"), .black]), center: .center, startRadius: 0, endRadius: 360))
                            .frame(width: 90, height: 40)
                            .shadow(radius: 4)
                        Text("Gotcha")
                            .font(.custom("Albertus Medium", size: 24))
                            .foregroundColor(.black)
                    }.overlay(Ellipse().stroke(lineWidth: 2).foregroundColor(.black).shadow(color: .black, radius: 1).blur(radius: 1))
                        .frame(width: 100)
                    
                }
            }.padding()
        }
        .background(
            ZStack{
                Image("EachOpponentBG")
                    .resizable()
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2).foregroundColor(.black).blur(radius: 1))
            }
        )
            .frame(width:300, height:300)
    }
}

//struct GameAlert_Previews: PreviewProvider {
//    static var previews: some View {
//        GameAlert()
//    }
//}

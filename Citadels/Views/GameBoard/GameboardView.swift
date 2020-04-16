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
        ZStack{
            VStack{
                OpponentView().edgesIgnoringSafeArea(.horizontal)
                Image("BrickWall")
                    .resizable()
                    .background(Color.gray)
                    .frame(height: 10)
                    .overlay(Rectangle().stroke(lineWidth: 1).shadow(radius: 5).blur(radius: 0.5).opacity(0.5))
                    .shadow(radius: 5)
                    .edgesIgnoringSafeArea(.horizontal)
                PlayerView()
                    .background(
                        Image("EachOpponentBG")
                            .resizable()
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                            .overlay(Rectangle().stroke(lineWidth: 2).shadow(radius: 5, x: -5, y: -5).blur(radius: 1))
                            .edgesIgnoringSafeArea(.horizontal)
                )
            }
            .background(
                RadialGradient(gradient: Gradient(colors: [.yellow, .orange]), center: .center, startRadius: 90, endRadius: 360).edgesIgnoringSafeArea(.all)
                    .overlay(Image("GameBG").resizable().edgesIgnoringSafeArea(.all))
            )
                .blur(radius: self.GM.showAlert ? 5:0)
                .animation(.easeInOut)
            
            GameAlert()
                .scaleEffect(self.GM.showAlert ? 1:0)
                .animation(.easeInOut)
            
        }
    }
}

//struct GameboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameboardView()
//    }
//}

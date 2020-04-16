//
//  HomeView.swift
//  Citadels
//
//  Created by Yongkun Li on 4/8/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var GM: GameManager
    @State var isGameStart:Bool = false
    
    var body: some View {
        ZStack{
            if isGameStart {
                GameboardView()
                    .transition(.slide)
            }else{
                VStack(alignment:.leading){
                    Image(systemName: "person.circle")
                    Text(self.GM.PlayerList[0].Name)
                        .padding()
                        
                    
                    Button(action:{
                        
                    }){
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                            Text("Create a Session")
                                .font(.custom("Albertus Medium", size: 20))
                                .foregroundColor(.white)
                        }.frame(width:200, height:50)
                    }.padding()
                    
                    Button(action:{
                        self.isGameStart = true
                    }){
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                            Text("Join a Session")
                                .font(.custom("Albertus Medium", size: 20))
                                .foregroundColor(.white)
                        }.frame(width:200, height:50)
                    }
                    .padding()
                }
                .background(Image("LoginBG"))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

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
                    Text("Player Name")
                        .padding()
                    Button(action:{
                        
                    }){
                        Text("Create a Session")
                    }.padding()
                    
                    Button(action:{
                        self.isGameStart = true
                    }){
                        Text("Join a Session")
                    }
                    .padding()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

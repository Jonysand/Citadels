//
//  ContentView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/7/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var GM:GameManager
    
    var body: some View {
        HStack{
            if self.GM.gs.isAuthenticated(){
                HomeView()
                    .transition(.move(edge: .leading))
            }else{
                LoginView()
            }
        }.animation(.easeInOut)
//        GameboardView()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

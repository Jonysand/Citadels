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
    @State var isAuthenticated:Bool = false
    
    var body: some View {
        HStack{
            if self.isAuthenticated{
                HomeView()
                    .transition(.move(edge: .leading))
            }else{
                LoginView(isAuthenticated: $isAuthenticated)
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

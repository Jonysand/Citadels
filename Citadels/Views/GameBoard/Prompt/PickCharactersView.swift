//
//  PickCharactersView.swift
//  Citadels
//
//  Created by Yongkun Li on 4/15/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct PickCharactersView: View {
    @EnvironmentObject var GM:GameManager
    
    var body: some View {
        VStack{
            Text("Choose your Role")
            // deposit
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<self.GM.depositChar.count, id: \.self){ i in
                        Image("\(self.GM.depositChar[i].Name)")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .overlay(Circle().stroke(lineWidth: 2).foregroundColor(.gray))
                            // for showing current player
                            .overlay(Circle().stroke(lineWidth: self.GM.currentPlayer == i ? 5:0).foregroundColor(.white).blur(radius: 5))
                            .shadow(radius: 5)
                            .padding()
                    }
                }
            }
            
            // all players
            Divider()
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<GM.playerCount, id: \.self){ i in
                        // show account head photot
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.gray))
                            .shadow(radius: 5)
                            .padding()
                    }
                }
            }
        }
    }
}

struct PickCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        PickCharactersView()
    }
}

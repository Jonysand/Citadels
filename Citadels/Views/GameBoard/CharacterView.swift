//
//  CharacterView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/19/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct CharacterView: View {
    var body: some View {
        VStack{
            // Character image
            Rectangle()
            
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

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView().frame(width: 100, height: 250)
    }
}

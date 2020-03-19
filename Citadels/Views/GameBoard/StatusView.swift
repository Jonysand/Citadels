//
//  StatusView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/19/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct StatusView: View {
    var body: some View {
        GeometryReader{ geo in
            VStack{
                // portrait
                Circle()
                    .frame(width: geo.size.width*2/3, height: geo.size.height*2/3)
                    .padding(0)
                // wealth
                HStack{
                    Image(systemName: "dollarsign.circle.fill")
                        .resizable()
                        .frame(width: geo.size.width/3, height: geo.size.width/3)
                    Text("5")
                    .frame(width: geo.size.width/2, height: geo.size.width/2)
                }.padding(0)
            }
        }.frame(width: 100, height: 150)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}

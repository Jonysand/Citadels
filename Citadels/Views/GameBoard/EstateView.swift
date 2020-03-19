//
//  EstateView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/19/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct EstateView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<5){_ in
                    Circle()
                        .frame(width: 100, height: 150)
                        .padding()
                }
            }
        }
    }
}

struct EstateView_Previews: PreviewProvider {
    static var previews: some View {
        EstateView()
    }
}

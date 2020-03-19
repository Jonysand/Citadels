//
//  CardsView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/9/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct CardsView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<5){_ in
                    Rectangle()
                        .frame(width: 100, height: 150)
                        .padding()
                }
            }
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView().frame(width: 400, height: 200)
    }
}

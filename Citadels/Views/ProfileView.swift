//
//  ProfileView.swift
//  Citadels
//
//  Created by Yongkun Li on 4/8/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle")
            Text("Player Name")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

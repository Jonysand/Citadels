//
//  District.swift
//  Citadels
//
//  Created by Yongkun Li on 3/7/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import Foundation

enum DistrictColor {
    case red
    case yellow
    case green
    case blue
    case purple
}

class District:ObservableObject{
    var Name: String
    var Cost: uint_fast8_t
    var Color: DistrictColor
    
    // 0 -> in deck;
    // 1 -> in hand;
    // 2 -> in estate;
    // 3 -> in air (about to throw)
    @Published var currentState:uint_fast8_t = 0
    
    init(Name: String, Cost: uint_fast8_t, Color: DistrictColor){
        self.Name = Name
        self.Cost = Cost
        self.Color = Color
    }
    
    func Effect(id: String){
        guard self.Color == .purple else {return}
        // function body
    }
}

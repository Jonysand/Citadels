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
    var Cost: Int
    var Color: DistrictColor
    @Published var isInHand:Bool
    
    init(Name: String, Cost: Int, Color: DistrictColor){
        self.Name = Name
        self.Cost = Cost
        self.Color = Color
    }
    
    func Effect(id: String){
        guard self.Color == .purple else {return}
        // function body
    }
}

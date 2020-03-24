//
//  ExampleData.swift
//  Citadels
//
//  Created by Yongkun Li on 3/7/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import Foundation

struct Characters {
    let Assasin = Character(Index: 1, Name: "Assasin")
    let Thief = Character(Index: 2, Name: "Thief")
    let Magician = Character(Index: 3, Name: "Magician")
    let King = Character(Index: 4, Name: "King")
    let Bishop = Character(Index: 5, Name: "Bishop")
    let Merchant = Character(Index: 6, Name: "Merchant")
    let Architect = Character(Index: 7, Name: "Architect")
    let Warlord = Character(Index: 8, Name: "Warlord")
}

struct Districts {
    // Red
    let Watchtower = District(Name: "Watchtower", Cost: 1, Color: .red)
    let Prison = District(Name: "Prison", Cost: 2, Color: .red)
    let Battlefield = District(Name: "Battlefield", Cost: 3, Color: .red)
    let Fortress = District(Name: "Fortress", Cost: 5, Color: .red)
    
    // Yellow
    let Manor = District(Name: "Manor", Cost: 3, Color: .yellow)
    let Castle = District(Name: "Castle", Cost: 4, Color: .yellow)
    let Palace = District(Name: "Palace", Cost: 5, Color: .yellow)
    
    // Green
    let Tavern = District(Name: "Tavern", Cost: 1, Color: .green)
    let Market = District(Name: "Market", Cost: 2, Color: .green)
    let TradingPost = District(Name: "Trading Post", Cost: 2, Color: .green)
    let Docks = District(Name: "Docks", Cost: 3, Color: .green)
    let Harbor = District(Name: "Harbor", Cost: 4, Color: .green)
    let TownHall = District(Name: "TownHall", Cost: 5, Color: .green)
    
    // Blue
    let Temple = District(Name: "Temple", Cost: 1, Color: .blue)
    let Church = District(Name: "Church", Cost: 2, Color: .blue)
    let Monastary = District(Name: "Monastary", Cost: 3, Color: .blue)
    let Cathedral = District(Name: "Cathedral", Cost: 5, Color: .blue)
    
    // Purple
    let HauntedCity = District(Name: "Haunted City", Cost: 2, Color: .purple)
    let Keep = District(Name: "Keep", Cost: 3, Color: .purple)
    let Laboratory = District(Name: "Laboratory", Cost: 5, Color: .purple)
    let Smithy = District(Name: "Smithy", Cost: 5, Color: .purple)
    let Observatory = District(Name: "Observatory", Cost: 5, Color: .purple)
    let Graveyard = District(Name: "Graveyard", Cost: 5, Color: .purple)
    let DragonGate = District(Name: "Dragon Gate", Cost: 6, Color: .purple)
    let University = District(Name: "University", Cost: 6, Color: .purple)
    let Library = District(Name: "Library", Cost: 6, Color: .purple)
    let GreatWall = District(Name: "Great Wall", Cost: 6, Color: .purple)
    let SchoolOfMagic = District(Name: "School Of Magic", Cost: 6, Color: .purple)
}



// examples
struct ExampleData {
    let characters = Characters()
    let districts = Districts()
    var PlayerList: [Player] = []
    var GM:GameManager = GameManager()
    
    init() {
        // init player list
        // Player.id==0 -> local player
        PlayerList.append(Player(id:0, Hand: [districts.Battlefield, districts.Castle],
                                 Estate: [districts.Cathedral, districts.Church],
                                 Role: characters.Architect))
        PlayerList.append(Player(id:1, Hand: [districts.Battlefield, districts.Castle],
                                 Estate: [districts.Cathedral, districts.Church],
                                 Role: characters.Merchant))
        PlayerList.append(Player(id:2, Hand: [districts.Battlefield, districts.Castle],
                                 Estate: [districts.Cathedral, districts.Church],
                                 Role: characters.Magician))
        PlayerList.append(Player(id:3, Hand: [districts.Battlefield, districts.Castle],
                                 Estate: [districts.Cathedral, districts.Church],
                                 Role: characters.King))
        
        // init game manager
        GM.PlayerList = PlayerList
        GM.currentPlayer = PlayerList[0].Role.Index
    }
}

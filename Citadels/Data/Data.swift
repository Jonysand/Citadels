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
    var list: [Character] = []
    
    init(){
        list.append(Assasin)
        list.append(Thief)
        list.append(Magician)
        list.append(King)
        list.append(Bishop)
        list.append(Merchant)
        list.append(Architect)
        list.append(Warlord)
    }
}

struct Districts {
    // Red
    let Watchtower = District(Name: "Watchtower", Cost: 1, Color: .red)
    let Prison = District(Name: "Prison", Cost: 2, Color: .red)
    let Barracks = District(Name: "Barracks", Cost: 3, Color: .red)
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
    let TownHall = District(Name: "Town Hall", Cost: 5, Color: .green)
    
    // Blue
    let Temple = District(Name: "Temple", Cost: 1, Color: .blue)
    let Church = District(Name: "Church", Cost: 2, Color: .blue)
    let Monastary = District(Name: "Monastary", Cost: 3, Color: .blue)
    let Cathedral = District(Name: "Cathedral", Cost: 5, Color: .blue)
    
    // Purple
    let HauntedQuarter = District(Name: "Haunted Quarter", Cost: 2, Color: .purple)
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
    let ImperialTreasury = District(Name: "Imperial Treasury", Cost: 5, Color: .purple)
    let MapRoom = District(Name: "Map Room", Cost: 5, Color: .purple)
}

// init Full Deck
func initDeck(Deck: inout [District]){
    let districts = Districts()
    for _ in 0..<3 {Deck.append(districts.Watchtower)}
    for _ in 0..<3 {Deck.append(districts.Prison)}
    for _ in 0..<3 {Deck.append(districts.Barracks)}
    for _ in 0..<2 {Deck.append(districts.Fortress)}
    for _ in 0..<5 {Deck.append(districts.Manor)}
    for _ in 0..<4 {Deck.append(districts.Castle)}
    for _ in 0..<3 {Deck.append(districts.Palace)}
    for _ in 0..<5 {Deck.append(districts.Tavern)}
    for _ in 0..<4 {Deck.append(districts.Market)}
    for _ in 0..<3 {Deck.append(districts.TradingPost)}
    for _ in 0..<3 {Deck.append(districts.Docks)}
    for _ in 0..<3 {Deck.append(districts.Harbor)}
    for _ in 0..<2 {Deck.append(districts.TownHall)}
    for _ in 0..<3 {Deck.append(districts.Temple)}
    for _ in 0..<3 {Deck.append(districts.Church)}
    for _ in 0..<3 {Deck.append(districts.Monastary)}
    for _ in 0..<2 {Deck.append(districts.Cathedral)}
    Deck.append(districts.HauntedQuarter)
    for _ in 0..<2 {Deck.append(districts.Keep)}
    Deck.append(districts.Laboratory)
    Deck.append(districts.Smithy)
    Deck.append(districts.Observatory)
    Deck.append(districts.Graveyard)
    Deck.append(districts.DragonGate)
    Deck.append(districts.University)
    Deck.append(districts.Library)
    Deck.append(districts.GreatWall)
    Deck.append(districts.SchoolOfMagic)
    Deck.shuffle()
}


// examples
struct ExampleData {
    let characters = Characters()
    var PlayerList: [Player] = []
    var GM:GameManager = GameManager()
    
    init() {
        // init player list
        // Player.id==0 -> local player
        for i in 0..<4 {
            // draw cards
            var handList: [District] = []
            for _ in 0..<Int.random(in: 1..<5){
                let drawIndex = Int.random(in: 0..<GM.Deck.count)
                let oneCard = GM.Deck[drawIndex]
                GM.Deck.remove(at: drawIndex)
                oneCard.currentState = 1
                handList.append(oneCard)
            }
            // put estates
            var estateList: [District] = []
            for _ in 0..<Int.random(in: 1..<5){
                let drawIndex = Int.random(in: 0..<GM.Deck.count)
                let oneCard = GM.Deck[drawIndex]
                GM.Deck.remove(at: drawIndex)
                oneCard.currentState = 2
                estateList.append(oneCard)
            }
            let player = Player(id: i, Hand: handList, Estate: estateList, Role: characters.list[i])
            PlayerList.append(player)
        }
        
        // init game manager
        GM.PlayerList = PlayerList
        GM.currentPlayer = PlayerList[0].Role.Index
    }
}

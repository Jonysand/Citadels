//
//  GameManager.swift
//  Citadels
//
//  Created by Yongkun Li on 3/7/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import Foundation
import SwiftUI
import Configuration

let manager = ConfigurationManager()

struct DraggedCard{
    var card:District
    var x:CGFloat = 0
    var y:CGFloat = 0
}

class GameManager:ObservableObject{
    @Published var GameState:Int = 0
    /*
     0: Game Start
     - Choose an initial King
     
     1: Choose Charactors
     */
    
    // state of showing alerts
    @Published var showAlert:Bool = false
    
    // container for dragged card
    @Published var draggedCard:DraggedCard?
    // container for depositted character
    @Published var depositChar:[Character] = []
    // amount of players in a session
    var playerCount = 4
    
    let characters = Characters()
    let districts = Districts()
    var PlayerList: [Player] = []
    @Published var currentPlayer: Int = 0
    var Deck: [District] = []
    var KingIndex:Int = 0
    
    // Game Spark setting
    let GSapiKey:String
    let GSapiSecret:String
    var gs:GS
    
    // For taking actions in turn
    var timer: Timer?
    
    init() {
        // init full deck
        initDeck(Deck: &Deck)
        
        // Game Spark settup
        manager.load(file: "GScrecidential.json", relativeFrom: .project)
        GSapiKey = (manager["apiKey"] as? String)!
        GSapiSecret = (manager["apiSecret"] as? String)!
        gs = GS.init(apiKey:GSapiKey, andApiSecret:GSapiSecret, andCredential:"device", andPreviewMode: true)
        //        gs.connect()
        
        // Init timer for game process pipline
        self.timer = Timer(fire: Date(), interval: (1.0),
                           repeats: true,
                           block:self.GameProcess)
        RunLoop.current.add(self.timer!, forMode: .default)
    }
    
    func login(username:String, password:String){
        let loginRequest = GSAuthenticationRequest()
        loginRequest.setUserName(username)
        loginRequest.setPassword(password)
        loginRequest.setCallback({ response in
            if (response != nil){
                print(response ?? "No Auth Response")
                print(response!.getDisplayName() ?? "No Display Name")
                self.PlayerList[0].Name = response!.getDisplayName()
            }else{
                print("Auth Failed")
            }
        })
        self.gs.send(loginRequest)
        // save username and password to KeyChain
        //        let account = username
        //        let password = password.data(using: String.Encoding.utf8)!
        //        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
        //                                    kSecAttrAccount as String: account,
        //                                    kSecAttrServer as String: "gamesparks.net",
        //                                    kSecValueData as String: password]
        //        let status = SecItemAdd(query as CFDictionary, nil)
        //        guard status == errSecSuccess else {
        //            print("Keychain Failed")
        //            return
        //        }
    }
    
    func GameProcess(timer: Timer){
        guard !showAlert else{return}
        switch self.GameState {
        // Initial Game
        case 0:
            // Choose the Initial King
            KingIndex = Int.random(in: 0..<PlayerList.count)
            showAlert.toggle()
            break
        
        // pick character cards
        case 1:
            showAlert.toggle()
            var playerIndex = KingIndex
            var charDeck:[Character] = characters.list
            charDeck.remove(at: 0)
            for i in 0..<PlayerList.count {
                self.currentPlayer = i
                if playerIndex != 0 {
                    // simulate
                    // add delay to simulate thinking time
                    SimDrawCharacter(playerIndex: playerIndex, charDeck: &charDeck, depositChar: &self.depositChar, KingIndex: self.KingIndex, playerCount: self.playerCount, PlayerList: &self.PlayerList)
                }else{
                    // local player
                    SimDrawCharacter(playerIndex: playerIndex, charDeck: &charDeck, depositChar: &self.depositChar, KingIndex: self.KingIndex, playerCount: self.playerCount, PlayerList: &self.PlayerList)
                }
                playerIndex += 1
                playerIndex = playerIndex >= PlayerList.count ? 0:playerIndex
            }
            break
        default:
            break
        }
    }
}

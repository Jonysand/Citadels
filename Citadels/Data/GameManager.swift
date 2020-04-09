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
    let characters = Characters()
    let districts = Districts()
    var PlayerList: [Player] = []
    var currentPlayer: Int = 0
    var Deck: [District] = []
    
    // Game Spark setting
    let GSapiKey:String
    let GSapiSecret:String
    var gs:GS
    // for local player
    @Published var draggedCard:DraggedCard? = nil;
    
    init() {
        // init full deck
        initDeck(Deck: &Deck)
        
        // Game Spart settup
        manager.load(file: "GScrecidential.json", relativeFrom: .project)
        GSapiKey = (manager["apiKey"] as? String)!
        GSapiSecret = (manager["apiSecret"] as? String)!
        gs = GS.init(apiKey:GSapiKey, andApiSecret:GSapiSecret, andCredential:"device", andPreviewMode: true)
        print(GSapiKey)
//        print(gs.connect())
    }
    
    //
    func login(username:String, password:String){
        let loginRequest = GSAuthenticationRequest()
        loginRequest.setUserName(username)
        loginRequest.setPassword(password)
        loginRequest.setCallback({ response in
            if (response != nil){
                print(response!.getDisplayName() ?? "No Display Name")
            }else{
                print("Auth Failed")
            }
        })
        self.gs.send(loginRequest)
        let account = username
        let password = password.data(using: String.Encoding.utf8)!
        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                    kSecAttrAccount as String: account,
                                    kSecAttrServer as String: "gamesparks.net",
                                    kSecValueData as String: password]
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            print("Keychain Failed")
            return
        }
    }
}

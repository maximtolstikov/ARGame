//
//  ContentProvider.swift
//  ARGame
//
//  Created by Maxim Tolstikov on 30.10.2021.
//

import Foundation

typealias Characters = [Character]

struct ContentProvider {    
    static var characters: Characters {
        Bundle.main.decode(Characters.self, from: "models.json")
    }
}

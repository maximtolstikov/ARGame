//
//  GameViewModel.swift
//  ARGame
//
//  Created by Maxim Tolstikov on 30.10.2021.
//

protocol GameViewModel {
    var character: Character { get }
}

final class GameViewModelImp: GameViewModel {
    // MARK: - Public properties
    let character: Character
    
    // MARK: - Init
    init(_ character: Character) {
        self.character = character
    }
}

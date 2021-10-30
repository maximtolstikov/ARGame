//
//  ModuleFactory.swift
//  ARGame
//
//  Created by Maxim Tolstikov on 30.10.2021.
//


struct ModuleFactory {
    static func buildGameScreen(_ character: Character) -> GameViewController {
        let viewModel = GameViewModelImp(character)
        return GameViewController(viewModel)
    }
    
    static func buildStartScreen() -> StartViewController {
        let viewModel = StartViewModelImp()
        return StartViewController(viewModel)
    }
}

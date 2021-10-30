//
//  StartViewModel.swift
//  ARGame
//
//  Created by Maxim Tolstikov on 30.10.2021.
//

import Foundation

protocol StartViewModel {
    var characters: Characters { get }
}

final class StartViewModelImp: StartViewModel {
    // MARK: - Public properties
    var characters: Characters {
        ContentProvider.characters
    }
}

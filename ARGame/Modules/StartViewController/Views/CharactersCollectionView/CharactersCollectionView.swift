//
//  CharactersCollectionView.swift
//  ARGame
//
//  Created by Maxim Tolstikov on 30.10.2021.
//

import UIKit

class CharactersCollectionView: UICollectionView {
    // MARK: - Init
    init() {
        super.init(frame: .zero, collectionViewLayout: CharactersCollectionFlowLayout())
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configuration
    private func configure() {
        backgroundColor = .clear
        register(
            CharactersCollectionViewCell.self,
            forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier
        )
    }    
}

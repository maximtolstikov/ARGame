//
//  CharactersCollectionFlowLayout.swift
//  ARGame
//
//  Created by Maxim Tolstikov on 30.10.2021.
//

import UIKit

class CharactersCollectionFlowLayout: UICollectionViewFlowLayout {
    // MARK: - Init
    override init() {
        super.init()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configuration
    private func configure() {
        itemSize = calculatedItemSize
        sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

    // MARK: - Private methods
    private var calculatedItemSize: CGSize {
        let width = (UIScreen.main.bounds.width - 32.0 - 16.0) / 2.0
        return CGSize(width: width, height: width)
    }
}

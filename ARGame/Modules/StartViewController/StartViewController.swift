//
//  StartViewController.swift
//  ARGame
//
//  Created by Maxim Tolstikov on 30.10.2021.
//

import SceneKit
import UIKit

final class StartViewController: UIViewController {
    // MARK: - Private properties
    private let charactersCollectionView = CharactersCollectionView()
    private let viewModel: StartViewModel
    
    // MARK: - Init
    init(_ viewModel: StartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    func configure() {
        view.backgroundColor = .lightGray
        charactersCollectionView.dataSource = self
        charactersCollectionView.delegate = self
        view.addSubview(charactersCollectionView)
        charactersCollectionView.snp.makeConstraints { make in
            make.center.left.right.equalToSuperview()
            make.height.equalTo(view.snp.width)
        }
    }
    
    // MARK: - Navigation
    private func onGame(_ character: Character) {
        let gameController = ModuleFactory.buildGameScreen(character)
        navigationController?.pushViewController(gameController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension StartViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        viewModel.characters.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharactersCollectionViewCell.identifier,
            for: indexPath
        ) as? CharactersCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configure(viewModel.characters[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension StartViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let character = viewModel.characters[indexPath.item]
        onGame(character)
    }
}

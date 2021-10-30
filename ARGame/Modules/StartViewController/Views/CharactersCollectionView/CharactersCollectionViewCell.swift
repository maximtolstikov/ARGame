//
//  CharactersCollectionViewCell.swift
//  ARGame
//
//  Created by Maxim Tolstikov on 30.10.2021.
//

import UIKit
import SceneKit

final class CharactersCollectionViewCell: UICollectionViewCell {
    // MARK: - Public properties
    static let identifier = "CharactersCollectionViewCell"
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        let roundPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: 22.0
        )
        let maskLayer = CAShapeLayer()
        maskLayer.path = roundPath.cgPath
        layer.mask = maskLayer
    }
    
    // MARK: - Public methods
    func configure(_ model: Character) {
        cleanBeforeConfigure()
        configureContent(model)
    }
    
    // MARK: - Private methods
    private func cleanBeforeConfigure() {
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func configureContent(_ model: Character) {
        let sceneName = "\(model.artName)/\(model.fileName).\(model.fileExtension)"
        guard let scene = SCNScene(named: sceneName) else { return }
        
        let sceneView = SCNView()
        sceneView.scene = scene
        
        contentView.addSubview(sceneView)
        sceneView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        sceneView.backgroundColor = .white
    }
}

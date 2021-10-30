//
//  ViewController.swift
//  ARGame
//
//  Created by Maxim Tolstikov on 30.10.2021.
//

import ARKit
import SceneKit
import SnapKit
import UIKit

final class GameViewController: UIViewController {
    // MARK: - Private properties
    private let sceneView = ARSCNView()
    private let configuration = ARWorldTrackingConfiguration()
    private let viewModel: GameViewModel
    
    // MARK: - Init
    init(_ viewModel: GameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    // MARK: - Configuration
    private func configure() {
        configuration.planeDetection = .horizontal
        sceneView.delegate = self
        view.addSubview(sceneView)
        sceneView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Private methods
    private func addCharacter(to node: SCNNode, with position: SCNVector3) {
        let model = viewModel.character
        let sceneName = "\(model.artName)/\(model.fileName).\(model.fileExtension)"
        guard let newScene = SCNScene(named: sceneName) else { return }
        
        if let myNode = newScene.rootNode.childNode(withName: model.nodeName, recursively: true) {
            myNode.position = position
            myNode.scale = SCNVector3(0.02, 0.02, 0.02)
            node.addChildNode(myNode)
        }
    }
}

// MARK: -ARSCNViewDelegate
extension GameViewController: ARSCNViewDelegate {
    func renderer(
        _ renderer: SCNSceneRenderer,
        didAdd node: SCNNode,
        for anchor: ARAnchor
    ) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        let targetPosition = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
        addCharacter(to: node, with: targetPosition)
    }
}

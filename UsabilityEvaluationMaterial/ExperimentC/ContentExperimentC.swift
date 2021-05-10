//
//  ContentExperimentC.swift
//  UsabilityEvaluationMaterial
//
//  Created by Yuji Sasaki on 2021/04/28.
//
import SwiftUI
import SpriteKit

struct ContentExperimentC: UIViewRepresentable {
    
    var isHard: Bool
    
    class Coordinator: NSObject {
        var scene: SKScene?
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        skView.backgroundColor = .white
        let scene = ExCScene(size: CGSize(width: 100, height: 200), isHard: isHard)
        context.coordinator.scene = scene
        return skView
    }
    
    func updateUIView(_ view: SKView, context: Context) {
        view.presentScene(context.coordinator.scene)
    }
}

struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentExperimentC(isHard: true)
    }
}

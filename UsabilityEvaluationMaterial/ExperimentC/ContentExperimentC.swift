//
//  ContentExperimentC.swift
//  UsabilityEvaluationMaterial
//
//  Created by Yuji Sasaki on 2021/04/28.
//
import SwiftUI
import SpriteKit

struct ContentExperimentC: UIViewRepresentable {
    class Coordinator: NSObject {var scene: SKScene?
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        let scene = SKScene()
        
        let targetMarker = SKNode(fileNamed: <#T##String#>)
        
        scene.scaleMode = .resizeFill
        scene.backgroundColor = UIColor.blue
        context.coordinator.scene = scene
        return skView
    }
    
    func updateUIView(_ view: SKView, context: Context) {
        view.presentScene(context.coordinator.scene)
    }
}

struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentExperimentC()
    }
}

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

class ExCScene: SKScene {
    
    private let targetMarker = SKShapeNode(circleOfRadius: 5)
    private let line: SKShapeNode
    private var lastTouch: CGPoint?
    private var realPosition: CGPoint?
    private var nextDice: Int = 0
    private var shouldMmove = true
    private let isHard: Bool
    private let startPoint: CGPoint
    
    private var points = [CGPoint]()
    
    init(size: CGSize, isHard: Bool) {
        self.isHard = isHard
        
        func x(for y: Double) -> CGFloat {
            let originY = y / 7
            let originX = size.width / 2 - 5
            let width = size.width
            let curveWidth = width * 0.4
            return originX + CGFloat(sin(originY)) * curveWidth
        }
        
        let startY = size.height - 16
        startPoint = CGPoint(x: x(for: Double(startY)), y: startY)
        
        
        let path = UIBezierPath()
        path.move(to:CGPoint(x: startPoint.x, y: 16))
        
        for y in 16 ... Int(startPoint.y) {
            let next = CGPoint(x: x(for: Double(y)), y: CGFloat(y))
            points.append(next)
            path.addLine(to: next)
        }
        line = SKShapeNode(path: path.cgPath)
        
        super.init(size: size)
        
        line.strokeColor = UIColor(red: 52/255, green: 79/255, blue: 161/255, alpha: 1)
        line.position = CGPoint(x: 5, y: 0)
        line.lineWidth = 10
        line.lineCap = .round
        line.lineJoin = .round
        addChild(line)
        
        
        targetMarker.lineWidth = 2
        targetMarker.fillColor = UIColor(red: 63/255, green: 54/255, blue: 141/255, alpha: 1)
        targetMarker.strokeColor = UIColor(red: 61/255, green: 132/255, blue: 184/255, alpha: 1)
        targetMarker.position = startPoint
        
        addChild(targetMarker)
        
        scaleMode = .aspectFit
        backgroundColor = UIColor(red: 240/255, green: 235/255, blue: 204/255, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouch = touches.first?.location(in: self)
        realPosition = targetMarker.position
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let initial = lastTouch, let here = touches.first?.location(in: self) else { return }
        let dx = here.x - initial.x
        var x = targetMarker.position.x + (isHard ? pow(dx * 0.5 , 2) * (dx < 0 ? -1 : 1) : dx)
        x = min(size.width, x)
        x = max(0, x)
        let dy = here.y - initial.y
        var y = targetMarker.position.y + (isHard ? pow(dy * 0.5, 2) * (dy < 0 ? -1 : 1) : dy)
        y = min(size.height, y)
        y = max(0, y)
        
        realPosition = CGPoint(x: x, y: y)
        
        if shouldMmove || !isHard {
            targetMarker.position = realPosition!
            
            //距離確認
            let isInside = points.contains(where: { abs($0.x - x) <= 4 && abs($0.y - y) <= 4  })
            targetMarker.fillColor = isInside ? UIColor(red: 63/255, green: 54/255, blue: 141/255, alpha: 1) : .red
            if !isInside {
                targetMarker.position = startPoint
            }
        }
        nextDice -= 1
        if nextDice < 0 {
            nextDice = Int.random(in: 1...7)
            shouldMmove = Bool.random()
        }
        
        lastTouch = touches.first?.location(in: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouch = nil
        realPosition = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouch = nil
        realPosition = nil
    }
    
}

struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentExperimentC(isHard: true)
    }
}

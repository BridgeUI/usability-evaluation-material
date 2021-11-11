//
//  ExperimentViewController.swift
//  UsabilityEvaluationMaterial2
//
//  Created by Yuji Sasaki on 2021/11/12.
//

import UIKit
import SwiftUI
import SpriteKit

class ExperimentViewController: UIViewController {
    
    @IBOutlet private weak var timerLabel: UILabel!
    @IBOutlet private weak var hosting: UIView!
    var remainTime = 18000
    var timer: Timer?
    let experiment: String
    let isHard: Bool
    
    init?(coder: NSCoder, experiment: String, isHard: Bool) {
        self.experiment = experiment
        self.isHard = isHard
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch experiment {
        case "experimentA":
            let experimentA = UIHostingController(rootView: ExperimentA(isHard: isHard))
            if let experimentAView = experimentA.view {
                experimentAView.translatesAutoresizingMaskIntoConstraints = false
                hosting.addSubview(experimentAView)
                experimentAView.topAnchor.constraint(equalTo: hosting.topAnchor).isActive = true
                experimentAView.leadingAnchor.constraint(equalTo: hosting.leadingAnchor).isActive = true
                experimentAView.trailingAnchor.constraint(equalTo: hosting.trailingAnchor).isActive = true
                experimentAView.bottomAnchor.constraint(equalTo: hosting.bottomAnchor).isActive = true
                
            }
            break
        case "experimentB":
            let skView = SKView()
            skView.backgroundColor = .white
            let scene = ExCScene(size: CGSize(width: 100, height: 200), isHard: isHard, showAlert: {
                let alert = UIAlertController(title: "GOAL", message: "ゴールに着きました!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "はじめから", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            })
            skView.translatesAutoresizingMaskIntoConstraints = false
            hosting.addSubview(skView)
            skView.topAnchor.constraint(equalTo: hosting.topAnchor).isActive = true
            skView.leadingAnchor.constraint(equalTo: hosting.leadingAnchor).isActive = true
            skView.trailingAnchor.constraint(equalTo: hosting.trailingAnchor).isActive = true
            skView.bottomAnchor.constraint(equalTo: hosting.bottomAnchor).isActive = true
            skView.presentScene(scene)
            
            
        default:
            break
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "開始", message: "準備ができたら開始を押してください", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: {
            _ in self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "開始", style: .default, handler: {
            _ in
            self.remainTime = 18000
            self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ExperimentViewController.timerUpdate), userInfo: nil, repeats: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func timerUpdate() {
        timerLabel.text = "残り時間　\(self.remainTime / 6000):\(NSString(format: "%02d",(remainTime % 6000) / 100)).\(NSString(format: "%02d", remainTime %  6000 % 100))"
        remainTime -= 1
        if remainTime <= 0 {
            timer?.invalidate()
            let alert = UIAlertController(title: "終了", message: "お疲れさまでした．スタッフの指示に従ってください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "了解", style: .default, handler: {
                _ in self.dismiss(animated: true, completion: nil)
            }))
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


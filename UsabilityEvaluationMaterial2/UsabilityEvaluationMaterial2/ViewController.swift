//
//  ViewController.swift
//  UsabilityEvaluationMaterial2
//
//  Created by Yuji Sasaki on 2021/11/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBSegueAction
    func gotoA1(coder: NSCoder, sender: Any?, segueIdentifier: String?) -> ExperimentViewController? {
        return ExperimentViewController(coder: coder, experiment: "experimentA", isHard: true)
    }
    
    @IBSegueAction
    func gotoA2(coder: NSCoder, sender: Any?, segueIdentifier: String?) -> ExperimentViewController? {
        return ExperimentViewController(coder: coder, experiment: "experimentA", isHard: false)
    }
    
    @IBSegueAction
    func gotoB1(coder: NSCoder, sender: Any?, segueIdentifier: String?) -> ExperimentViewController? {
        return ExperimentViewController(coder: coder, experiment: "experimentB", isHard: true)
    }
    
    @IBSegueAction
    func gotoB2(coder: NSCoder, sender: Any?, segueIdentifier: String?) -> ExperimentViewController? {
        return ExperimentViewController(coder: coder, experiment: "experimentB", isHard: false)
    }

}


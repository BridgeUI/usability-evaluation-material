//
//  ExperimentC.swift
//  UsabilityEvaluationMaterial
//
//  Created by 村上聡 on 2021/04/24.
//

import SwiftUI

struct ExperimentC: View {
    var isHard: Bool
    
    var body: some View {
        VStack {
            Counter()
            ContentExperimentC(isHard: isHard)
        }
    }
}

struct ExperimentC_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentC(isHard: true)
    }
}

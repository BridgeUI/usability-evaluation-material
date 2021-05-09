//
//  ContentExperimentB.swift
//  UsabilityEvaluationMaterial
//
//  Created by 村上聡 on 2021/05/05.
//

import SwiftUI

struct ExperimentB: View {
    var isHard: Bool
    var body: some View {
        VStack {
            Counter()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        
    }
}

struct ContentExperimentB_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentB(isHard: true)
    }
}

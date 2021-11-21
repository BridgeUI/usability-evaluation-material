//
//  ExperimentC.swift
//  UsabilityEvaluationMaterial
//
//  Created by 村上聡 on 2021/04/24.
//

import SwiftUI

struct ExperimentC: View {

    var isHard: Bool
    @State var showAlert: Bool
    
    var body: some View {
        VStack {
            ContentExperimentC(isHard: isHard, showAlert: $showAlert)
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("GOAL"), message: Text("ゴールに到達しました"), dismissButton: .default(Text("続ける")))
        }
        
       
    }
}

struct ExperimentC_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentC(isHard: true)
    }
}

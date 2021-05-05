//
//  ExperimentB.swift
//  UsabilityEvaluationMaterial
//
//  Created by 村上聡 on 2021/04/24.
//

import SwiftUI

struct ExperimentB: View {
    var isHard: Bool
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("")
                .frame(width:280)
                .padding()
            
            Spacer()
            
            NavigationLink(destination: ContentExperimentB(isHard: isHard)) {
                Text("始める")
                    .frame(maxWidth:.infinity)
                    .frame(height:50)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10.0)
                    .shadow(radius: 3, x:3, y:3)
                    .padding(.all)
            }
        }
    }
}

    

struct ExperimentB_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentB(isHard: true)
    }
}

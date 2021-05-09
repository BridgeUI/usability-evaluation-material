//
//  DescriptionBeforeExperiment.swift
//  UsabilityEvaluationMaterial
//
//  Created by Yuji Sasaki on 2021/05/09.
//

import SwiftUI

struct DescriptionBeforeExperiment<Content>: View where Content: View {
    var text: String
    var content: Content
    
    var body: some View {
        VStack{
            Spacer()
            Text(text)
                .frame(width:280)
                .padding()
            Spacer()
            
            NavigationLink(destination: content.navigationBarHidden(true) ) {
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

struct DescriptionBeforeExperiment_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionBeforeExperiment(text: "この実験は数字に対する能力を測るものです．表示される数字を小さい順に正確に並べ替えてください．", content: ExperimentA(isHard: true))
    }
}

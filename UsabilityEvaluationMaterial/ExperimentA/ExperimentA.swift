//
//  ExperimentA.swift
//  UsabilityEvaluationMaterial
//
//  Created by Yuji Sasaki on 2021/04/21.
//

import SwiftUI

struct ExperimentA: View {
    
    var isHard: Bool
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("この実験は数字に対する能力を測るものです．表示される数字を小さい順に正確に並べ替えてください．")
                .frame(width:280)
                .padding()
            //ここの文面は上田さんに要確認
            
            Spacer()
            
            NavigationLink(destination: ContentExperimentA(isHard: isHard)) {
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


struct ExperimentA_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentA(isHard: true)
    }
}

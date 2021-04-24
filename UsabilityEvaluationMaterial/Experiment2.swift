//
//  Experiment1.swift
//  UsabilityEvaluationMaterial
//
//  Created by Yuji Sasaki on 2021/04/21.
//

import SwiftUI

struct Experiment2: View {
    
    var body: some View {
        
        NavigationView {
            VStack{
                Spacer()
                Text("これから画面に表示される数字を打ち込んでください。制限時間は1分です。")
                    .frame(width:280)
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: ContentExperiment2()) {
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
}

struct Experiment2_Previews: PreviewProvider {
    static var previews: some View {
        Experiment2()
    }
}

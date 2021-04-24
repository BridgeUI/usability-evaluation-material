//
//  ContentView.swift
//  UsabilityEvaluationMaterial
//
//  Created by Yuji Sasaki on 2021/04/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            VStack(spacing: 16.0) {
                Text("実験マテリアル").bold()
                Spacer()
                ExperimentNavButton(title: "実験 A-1", destination: Experiment1())
                ExperimentNavButton(title: "実験 A-2", destination: Experiment2())
                ExperimentNavButton(title: "実験 B-1", destination: Experiment1())
                ExperimentNavButton(title: "実験 B-2", destination: Experiment1())
                ExperimentNavButton(title: "実験 C-1", destination: Experiment1())
                ExperimentNavButton(title: "実験 C-2", destination: Experiment1())
                ExperimentNavButton(title: "実験 D-1", destination: Experiment1())
                ExperimentNavButton(title: "実験 D-2", destination: Experiment1())
            }.padding(40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExperimentNavButton<Destination>: View where Destination: View{
    var title: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(
            destination: destination,
            label: {
                Text(title).padding().background(Color.blue).foregroundColor(.white).cornerRadius(8)
            })
    }
}

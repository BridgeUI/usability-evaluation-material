//
//  ContentView.swift
//  UsabilityEvaluationMaterial
//
//  Created by Yuji Sasaki on 2021/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isHard = false
    
    let descriptions = [
        "この実験は数字に対する能力を測るものです．表示される数字を小さい順に正確に並べ替えてください．",
        "",
        "",
        ""
    ]
    
    var body: some View {
        NavigationView{
            VStack(spacing: 16.0) {
                Text("実験マテリアル").bold()
                Spacer()
                ExperimentNavButton(label: "A", number: "1", text: descriptions[0], destination: ExperimentA(isHard: true))
                ExperimentNavButton(label: "A", number: "2", text: descriptions[0], destination: ExperimentA(isHard: true))
                ExperimentNavButton(label: "B", number: "1", text: descriptions[0], destination: ExperimentB(isHard: true))
                ExperimentNavButton(label: "B", number: "2", text: descriptions[0], destination: ExperimentB(isHard: false))
                ExperimentNavButton(label: "C", number: "1", text: descriptions[0], destination: ExperimentC(isHard: true))
                ExperimentNavButton(label: "C", number: "2", text: descriptions[0], destination: ExperimentC(isHard: true))
                ExperimentNavButton(label: "D", number: "1", text: descriptions[0], destination: ExperimentD())
                ExperimentNavButton(label: "D", number: "2", text: descriptions[0], destination: ExperimentD())
                
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
    var label: String
    var number: String
    var text: String
    var destination: Destination
    private var title: String {
        "実験 \(label)-\(number)"
    }
    
    var body: some View {
        NavigationLink(
            destination:  DescriptionBeforeExperiment(text: text, content: destination).navigationBarTitle(title) ,
            label: {
                Text(title).padding().background(Color.blue).foregroundColor(.white).cornerRadius(8)
            })
    }
}

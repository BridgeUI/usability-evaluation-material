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
    
    let message2 = "実験は終了です．\nスタッフに知らせてください．"
    
    @State var isPresented = false
    @State var counterValue = CounterValue()
    @State var isBackFromView = false
    
    var body: some View {
        VStack{
            Spacer()
            Text(isBackFromView  ? message2 : text).multilineTextAlignment(.center)
            Spacer()
            if !isBackFromView {
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Text("開始")
                        .frame(maxWidth:.infinity)
                        .frame(height:50)
                        .font(.title)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                })
                .fullScreenCover(isPresented: $isPresented, onDismiss: {
                    isBackFromView = true
                }, content: {
                    VStack {
                        Counter(isPresented: $isPresented)
                        content
                    }.environmentObject(counterValue)
                })
            } else {
                VStack {
                    Text("スコア").font(.title.weight(.medium)).padding()
                    HStack{
                        Image(systemName: "checkmark").foregroundColor(.green).font(.title.weight(.bold))
                        Spacer()
                        Text("\(counterValue.correctCount)").font(.title.weight(.medium))
                    }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100, alignment: .center)
                    HStack {
                        Image(systemName: "xmark").foregroundColor(.red).font(.title.weight(.bold))
                        Spacer()
                        Text("\(counterValue.incorrectCount)").font(.title.weight(.medium))
                    }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100, alignment: .center)
                }
            }
            Spacer()
        }.padding(24)
    }
}

struct DescriptionBeforeExperiment_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionBeforeExperiment(text: "この実験は数字に対する能力を測るものです．表示される数字を小さい順に正確に並べ替えてください．", content: ExperimentA(isHard: true))
    }
}

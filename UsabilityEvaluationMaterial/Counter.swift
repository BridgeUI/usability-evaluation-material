//
//  Counter.swift
//  UsabilityEvaluationMaterial
//
//  Created by Yuji Sasaki on 2021/05/09.
//

import SwiftUI
import Combine

struct Counter: View {
    
    @State var count = 1000
    @Binding var isPresented: Bool
    
    @EnvironmentObject var counterValue: CounterValue
    
    var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "clock").foregroundColor(.gray).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.bold))
            Text("\(count / 6000):\(NSString(format: "%02d",(count % 6000) / 100)).\(NSString(format: "%02d", count %  6000 % 100))").font(.title.monospacedDigit().weight(.medium)).onReceive(timer) { _ in
                count -= 1
                isPresented = count > 0
            }
            Spacer()
            Image(systemName: "checkmark").foregroundColor(.green).font(.title.weight(.bold))
            Text("\(counterValue.correctCount)").font(.title.weight(.medium))
            Spacer()
            Image(systemName: "xmark").foregroundColor(.red).font(.title.weight(.bold))
            Text("\(counterValue.incorrectCount)").font(.title.weight(.medium))
            Spacer()
        }.padding(24)
    }
}

class CounterValue: ObservableObject {
    @Published var correctCount = 0
    @Published var incorrectCount = 0
}

struct Counter_Previews: PreviewProvider {
    @State static var isPresented = true
    
    static var previews: some View {
        Counter(isPresented: $isPresented).environmentObject(CounterValue())
    }
}

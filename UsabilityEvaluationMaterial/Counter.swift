//
//  Counter.swift
//  UsabilityEvaluationMaterial
//
//  Created by Yuji Sasaki on 2021/05/09.
//

import SwiftUI
import Combine

struct Counter: View {
    
    @State var count = 30000
    var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "clock").foregroundColor(.gray).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.bold))
            Text("\(count / 6000):\(NSString(format: "%02d",(count % 6000) / 100)).\(NSString(format: "%02d", count %  6000 % 100))").font(.title.monospacedDigit().weight(.medium)).onReceive(timer) { _ in
                count -= 1
            }
            Spacer()
            Image(systemName: "checkmark").foregroundColor(.green).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.bold))
            Text("10").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.medium))
            Spacer()
            Image(systemName: "xmark").foregroundColor(.red).font(.title.weight(.bold))
            Text("10").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.medium))
            Spacer()
        }.padding(24)
    }
}

struct Counter_Previews: PreviewProvider {
    static var previews: some View {
        Counter()
    }
}

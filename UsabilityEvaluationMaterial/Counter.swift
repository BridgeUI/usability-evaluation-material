//
//  Counter.swift
//  UsabilityEvaluationMaterial
//
//  Created by Yuji Sasaki on 2021/05/09.
//

import SwiftUI
import Combine

struct Counter: View {
    
    @State var count = 18000
    @Binding var isPresented: Bool
    
    
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
        }.padding(24)
    }
}

struct Counter_Previews: PreviewProvider {
    @State static var isPresented = true
    
    static var previews: some View {
        Counter(isPresented: $isPresented)
    }
}

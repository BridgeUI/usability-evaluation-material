//
//  ContentExperimentA.swift
//  UsabilityEvaluationMaterial
//
//  Created by 村上聡 on 2021/04/24.
//

import SwiftUI
import UIKit

struct TaskState {
    var taskNumber:Double = 0
    init() {
        for i in [1,10,100,1000,10000,100000] {
            taskNumber = taskNumber + Double(Int.random(in: 1..<9) * i)
        }
    }
}

struct InputState {
    
    var currentNumber: Double = 0
    mutating func  appendNumber(_ number: Double) {
        if number.truncatingRemainder(dividingBy: 1) == 0
            &&
            currentNumber.truncatingRemainder(dividingBy: 1)==0{
            currentNumber = 10 * currentNumber + number
        }else{
            currentNumber = number
        }
    }
}

struct ContentExperimentA: View {
    
    
    @State var state = InputState()
    var displayedString: String{
        return String(format: "%.0f", arguments:[state.currentNumber])
    }
    
    @State var task = TaskState()
    var taskString:String {
        return String(format: "%.0f", arguments: [task.taskNumber])
    }
    
    @State var correct:Int = 0
    
    func check() {
        if state.currentNumber == task.taskNumber{
            correct += 1
            state.currentNumber = 0
            task = TaskState()
        }else{
            state.currentNumber = 0
        }
    }
    
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("5問中\(correct)問正解")
                    .font(.title)
                    .padding(.horizontal)
            }
            
            Text(taskString)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top)
            
            Text(displayedString)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.all)
                .frame(maxWidth:.infinity)
                .frame(height:160)
                .foregroundColor(Color.white)
                .background(Color.gray)
            
            Spacer()
            
            HStack{
                NumberView(number: 1, state: $state)
                NumberView(number: 2, state: $state)
                NumberView(number: 3, state: $state)
            }
            HStack{
                NumberView(number: 4, state: $state)
                NumberView(number: 5, state: $state)
                NumberView(number: 6, state: $state)
            }
            HStack{
                NumberView(number: 7, state: $state)
                NumberView(number: 8, state: $state)
                NumberView(number: 9, state: $state)
            }
            
            Button(action: {
                state.currentNumber = 0
            }) {
                Text("クリア")
                    .frame(maxWidth:.infinity)
                    .frame(height:50)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
            }
            .cornerRadius(10.0)
            .padding(.all)
            .shadow(radius: 3, x:3, y:3)
            
            Button(action: {
                check()
            }) {
                Text("決定")
                    .frame(maxWidth:.infinity)
                    .frame(height:50)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
            }
            .cornerRadius(10.0)
            .padding(.all)
            .shadow(radius: 3, x:3, y:3)
        }
    }
    
}


struct NumberView: View {
    let number:Double
    @Binding var state: InputState
    
    @State var numberTap = Int.random(in: 1..<3)
    //ボタンを押さなければいけない回数は要検討．気づかれやすいため，0-3の方がいいかもしれない
    @State var countTap = 0
    
    @Binding var isHard: Bool
    
    var numberString: String{
        return String(Int(number))
    }
    
    var body: some View{
        
        Button(action: {
            
            if(isHard == true){
                if (countTap == numberTap) {
                    self.state.appendNumber(self.number)
                    countTap = 0
                    numberTap = Int.random(in: 1..<3)
                }else{
                    self.countTap += 1
                }
            }else{
                self.state.appendNumber(self.number)
            }
            
        }) {
            Text(numberString)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                .frame(width: 64, height: 64)
                .background(Color(.gray))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(radius: 3, x:3, y:3)
                .padding(.all,10)
        }
    }
}



struct ContentExperimentA_Previews: PreviewProvider {
    static var previews: some View {
        ContentExperimentA()
    }
}

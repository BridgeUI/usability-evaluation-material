//
//  ContentExperimentA.swift
//  UsabilityEvaluationMaterial
//
//  Created by 村上聡 on 2021/04/24.
//

import SwiftUI
import UIKit

struct TaskState {
    var array:[Int] = [1,2,3,4,5,6,7,8,9]
    var taskNumber:Double = 0
    var correctNumber:Double = 0
    
    init() {
        
        let randomArray = array.shuffled().prefix(6)
        for i in 0...5 {
            let n = randomArray[i]
            taskNumber += Double(n) * pow(10, Double(i))
        }
        
        let correctArray = randomArray.sorted{$0<$1}
        for i in 0...5 {
            let nc = correctArray[i]
            correctNumber += Double(nc) * pow(10, Double(i))
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

struct ExperimentA: View {
    var isHard: Bool
    
    @State var state = InputState()
    var displayedString: String{
        return String(format: "%.0f", arguments:[state.currentNumber])
    }
    
    @State var task = TaskState()
    var taskString:String {
        return String(format: "%.0f", arguments: [task.taskNumber])
    }
    
    @State var showingAlert = false
    @State var isCheck:String = "正解"
    
    
    func check() {
        if state.currentNumber == task.correctNumber{
            //正解の時
            self.isCheck = "正解"
            task = TaskState()
        }else{
            //不正解の時
            self.isCheck = "不正解"
            task = TaskState()
        }
        state.currentNumber = 0
        showingAlert = true
    }
    
    var body: some View {
        VStack{
            
            Text(taskString)
                .font(.largeTitle)
                .fontWeight(.bold)
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
                NumberView(number: 1, state: $state, isHard: isHard)
                NumberView(number: 2, state: $state, isHard: isHard)
                NumberView(number: 3, state: $state, isHard: isHard)
            }
            HStack{
                NumberView(number: 4, state: $state, isHard: isHard)
                NumberView(number: 5, state: $state, isHard: isHard)
                NumberView(number: 6, state: $state, isHard: isHard)
            }
            HStack{
                NumberView(number: 7, state: $state, isHard: isHard)
                NumberView(number: 8, state: $state, isHard: isHard)
                NumberView(number: 9, state: $state, isHard: isHard)
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
            .alert(isPresented: $showingAlert){
                Alert(title:Text(isCheck),dismissButton: .default(Text("OK")))
            
                    
            
            }
        }
    }
    
}


struct NumberView: View {
    let number:Double
    @Binding var state: InputState
    
    //    @State var numberTap = Int.random(in: 1..<3)
    //    //ボタンを押さなければいけない回数は要検討．気づかれやすいため，0-3の方がいいかもしれない
    //    @State var countTap = 0
    
    var isHard: Bool
    
    var numberString: String{
        return String(Int(number))
    }
    
    var body: some View{
        
        Button(action: {
            
            if (isHard) {
                if (1 == Int.random(in: 1..<3))  {
                    self.state.appendNumber(self.number)
                }else{
                    
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
        ExperimentA(isHard: true)
    }
}

//
//  ContentExperimentA.swift
//  UsabilityEvaluationMaterial
//
//  Created by 村上聡 on 2021/04/24.
//

import SwiftUI
import UIKit

struct TaskState {
    var array:[String] = ["1","2","3","4","5","6","7","8","9"]
    var taskNumber:String=""
    var correctNumber:String=""
    
    init() {
        let randomArray = array.shuffled().prefix(6)
        for i in 0...5 {
            taskNumber += randomArray[i]
        }
        
        let correctArray = randomArray.sorted{$0<$1}
        for i in 0...5 {
            correctNumber += correctArray[i]
        }
    }
}

struct InputState {
    
    var currentNumber: String = ""
    mutating func  appendNumber(_ number: Int) {
            currentNumber +=  String(number)
    }
}

struct ExperimentA: View {
    var isHard: Bool
    
    @State var state = InputState()
    @State var task = TaskState()
    
    @State var showingAlert = false
    @State var isCheck:String = "正解"
    
    func check() {
        if String(state.currentNumber) == task.correctNumber{
            //正解の時
            self.isCheck = "正解"
            task = TaskState()
        }else{
            //不正解の時
            self.isCheck = "不正解"
            task = TaskState()
        }
        state.currentNumber = ""
        showingAlert = true
    }
    
    var body: some View {
        VStack{
            
            Text(task.taskNumber)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            Text(state.currentNumber)
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
                state.currentNumber = ""
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
    let number:Int
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

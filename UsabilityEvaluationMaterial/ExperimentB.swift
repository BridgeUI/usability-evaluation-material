//
//  ExperimentB.swift
//  UsabilityEvaluationMaterial
//
//  Created by 村上聡 on 2021/08/10.
//

import SwiftUI

struct RandomChoices {
    var month = ["Janually","Februally","March","April","May","June","July","August","September","October","November","December"]
    var date = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    var year = (1960...2010).map{"\($0)"}
    
    init() {
        self.month = month.shuffled()
        self.date = date.shuffled()
    }
    
}


struct ExperimentB: View {
    
    var isHard:Bool
    @State private var selectiedDate = Date()
    @State var monthIndex = 1
    @State var dateIndex = 1
    @State var yearIndex = 20
    var rc = RandomChoices()
    
    var body: some View {
        
        VStack{
            Text("生年月日を入力してください")
                .font(.title)
                .bold()
            
            Spacer()
            
            if isHard==true{
                DatePicker("生年月日を入力してください", selection: $selectiedDate,displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
            }else{
                HStack{
                    Picker(selection:$monthIndex,label:Text("month")){
                        ForEach(0..<rc.month.count){
                            Text(rc.month[$0])
                        }
                    }
                    .frame(width:100)
                    .clipped()
                    
                    Picker(selection:$dateIndex,label:Text("date")){
                        ForEach(0..<rc.date.count){
                            Text(rc.date[$0])
                        }
                    }
                    .frame(width:100)
                    .clipped()
                    
                    Picker(selection:$yearIndex,label:Text("year")){
                        ForEach(0..<rc.year.count){
                            Text(rc.year[$0])
                        }
                    }
                    .frame(width:100)
                    .clipped()
                }
            }
            
            Spacer()
            
            Button(action: {
                
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



struct ExperimentB_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentB(isHard:true)
    }
}

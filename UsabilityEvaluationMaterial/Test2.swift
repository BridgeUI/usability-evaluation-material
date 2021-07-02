//
//  Test2.swift
//  UsabilityEvaluationMaterial
//
//  Created by 村上聡 on 2021/06/14.
//

import SwiftUI

struct Task {
    let dict = [
        "食べ物":["ラーメン","オムライス","ステーキ","おにぎり","カレー"],
        "スポーツ":["テニス","野球","バレーボール","卓球","バスケットボール"],
        "乗り物":["新幹線","バス","タクシー","電車","自転車","飛行機"],
        "職業":["学者","農家","公務員","医者","警察","宇宙飛行士"],
        "果物":["みかん","ぶどう","りんご","バナナ","もも","スイカ"],
        "あ":[],
        "い":[]
    ]
    
    

    init(){
        let keys = [String](dict.keys)
        let randomDict = keys.shuffled()
        let randomNum = Int.random(in:0...5)
        let taskTitle = randomDict[randomNum]
        let taskItem = dict[taskTitle]?.randomElement()
    }
    //buildが終わらないのはlazyが原因?
}


struct Test2: View {
    
    
    @State var task = Task()
    @State private var selection = 0
    
    var body: some View {
        VStack {
            
            HStack{
                Text(task.taskTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.all)
                Text(task.taskItem)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.all)
            }
            
            Spacer()
            Picker(selection: $selection, label: Text("課題")) {
                ForEach(0 ..< task.randomDict.count) { index in
                    Text(self.task.randomDict[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())    // セグメントピッカースタイルの指定
            .frame(width: 350)
            
            Text(task.randomDict[selection]?[0])
            Text(task.randomDict[selection]?[1])
            Text(task.randomDict[selection]?[2])
            Text(task.randomDict[selection]?[3])
            Text(task.randomDict[selection]?[4])
            Text(task.randomDict[selection]?[5])
        }
    }
    
}



struct Test2_Previews: PreviewProvider {
    static var previews: some View {
        Test2()
    }
}

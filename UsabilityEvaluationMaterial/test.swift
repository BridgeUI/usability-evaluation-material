//
//  test.swift
//  UsabilityEvaluationMaterial
//
//  Created by 村上聡 on 2021/06/12.
//

import SwiftUI


struct Task {
    var dict = [
        "食べ物":["ラーメン","オムライス","ステーキ","おにぎり","カレー"],
        "スポーツ":["テニス","野球","バレーボール","卓球","バスケットボール"],
        "乗り物":["新幹線","バス","タクシー","電車","自転車","飛行機"],
        "職業":["学者","農家","公務員","医者","警察","宇宙飛行士"],
        "果物":["みかん","ぶどう","りんご","バナナ","もも","スイカ"],
        "あ":[],
        "い":[]
    ]
    
    var correctArray:[String]
    
    init(correctArray:[String]) {
        let randomArray = dict.keys.shuffled().prefix(5)
        for i in 0...4 {
            let n = randomArray[i]
            self.correctArray.append(n)
        }
    }
}

struct test: View {
    
    @State var task = Task()
    @State var selection = 0
    
    var titleString = task.correctArray.randomElement()
    var itemString = "い"
    
    var body: some View {
        
        VStack {
            HStack{
                Text(titleString)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.all)
                Text(itemString)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.all)
            }
            Picker(selection: $selection, label: Text("フルーツを選択")) {
                ForEach(0 ..< task.correctArray.count) { num in
                    Text(task.correctArray[num])
                }
            }
            .pickerStyle(SegmentedPickerStyle())    // セグメントピッカースタイルの指定
            .frame(width: 350)
            
            Text("選択値：\(task.correctArray[selection])")
        }
    }
}


struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}


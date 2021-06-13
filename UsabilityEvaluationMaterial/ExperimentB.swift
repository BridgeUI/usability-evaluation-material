//
//  ContentExperimentB.swift
//  UsabilityEvaluationMaterial
//
//  Created by 村上聡 on 2021/05/05.
//

import SwiftUI

struct TaskStateB{
    var dict = [
        "食べ物":["ラーメン","オムライス","ステーキ","おにぎり","カレー"],
        "スポーツ":["テニス","野球","バレーボール","卓球","バスケットボール"],
        "乗り物":["新幹線","バス","タクシー","電車","自転車","飛行機"],
        "職業":["学者","農家","公務員","医者","警察"],
    ]
    
}


struct ExperimentB: View {
    var task = TaskStateB()
    var isHard: Bool
    
    var titleString = "あ"
    var itemString = "い"
    
    
    
    var body: some View {
        VStack{
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
            
            Spacer()
            
            HStack{
                VStack{
                    Title(isHard: isHard, title: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                }
                VStack{
                    Title(isHard: isHard, title: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                }
                VStack{
                    Title(isHard: isHard, title: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                }
                VStack{
                    Title(isHard: isHard, title: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                }
                VStack{
                    Title(isHard: isHard, title: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                    Item(isHard: isHard, name: "1")
                }
            }
            
            Spacer()
            
        }
    }
}



struct Title: View{
    var isHard: Bool
    var title:String
    var titleName:String{
        return title
    }
    var body: some View{
        Text(title)
            .font(.largeTitle)
            .padding(.all,5)
    }
}
struct Item: View {
    var isHard: Bool
    var name:String
    var itemName: String{
        return name
    }
    var body: some View{
        Button(action:
                {
                    if(name == "1"){
                        
                    }
                }
        ) {
            Text(itemName)
                .font(.title)
                .padding(.all,5)
        }
    }
}


struct ContentExperimentB_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentB(isHard: true)
    }
}

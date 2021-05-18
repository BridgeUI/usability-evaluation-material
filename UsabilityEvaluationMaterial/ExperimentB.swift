//
//  ContentExperimentB.swift
//  UsabilityEvaluationMaterial
//
//  Created by 村上聡 on 2021/05/05.
//

import SwiftUI

struct ExperimentB: View {
    
    var isHard: Bool
    var body: some View {
        HStack{
            VStack{
                Title(isHard: isHard, title: "1")
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
            }
            VStack{
                Title(isHard: isHard, title: "1")
                Item(isHard: isHard, name: "1")
                Item(isHard: isHard, name: "1")
                Item(isHard: isHard, name: "1")
                Item(isHard: isHard, name: "1")
                Item(isHard: isHard, name: "1")
            }
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
            .font(.title)
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
                .font(.body)
                .padding(.all,5)
        }
    }
}


struct ContentExperimentB_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentB(isHard: true)
    }
}

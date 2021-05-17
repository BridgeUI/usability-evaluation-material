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
        VStack{
            HStack{
                Item(isHard: isHard, name: "1")
                Item(isHard: isHard, name: "1")
                Item(isHard: isHard, name: "1")
            }
            HStack{
                Item(isHard: isHard, name: "1")
                Item(isHard: isHard, name: "1")
                Item(isHard: isHard, name: "1")
            }
            HStack{
                Item(isHard: isHard, name: "1")
                Item(isHard: isHard, name: "1")
                Item(isHard: isHard, name: "1")
            }
        }
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
                .padding(.all,10)
        }
    }
}


struct ContentExperimentB_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentB(isHard: true)
    }
}

//
//  ContentView.swift
//  UsabilityEvaluationMaterial
//
//  Created by Yuji Sasaki on 2021/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isHard = false
    
    let descriptions = [
        "この実験は数学の基礎的な能力を測るものです．実験を開始すると次のような画面が表示されます．上に数字，その下に入力画面，その下にテンキーが表示されます．上に表示されている数字を小さい順に入力画面に打ち込んで，打ち込み終わったら決定ボタンを押してください．入力を間違えた場合は，クリアボタンを押すことで入力を取り消すことができます．正解すると緑のチェックボックスの横にカウントされます，不正解の場合は×でカウントされます．制限時間は3分間です．",
        "この課題は細かい操作の速さと正確さの能力を測るものです．実験を開始すると次のような画面が表示されます．ブルーの通路の右上にブルーのボールが配置されています．このボールを指でスライドするとスライドした方向に移動します．ブルーの道からはみ出さないように一番下までボールを持っていってください．成功すると緑のチェックボックスの横にカウントされます，制限時間は3分間です．",
        "アンケートにお答えください"
    ]
    
    var body: some View {
        NavigationView{
            VStack(spacing: 16.0) {
                Text("実験マテリアル").bold()
                Spacer()
                NavigationLink(
                    destination:  QuestionsBefore(),
                    label: {
                        Text("事前アンケート").padding().background(Color.blue).foregroundColor(.white).cornerRadius(8)
                    })
                ExperimentNavButton(label: "A", number: "1", text: descriptions[0], destination: ExperimentA(isHard: true))
                ExperimentNavButton(label: "A", number: "2", text: descriptions[0], destination: ExperimentA(isHard: false))
                ExperimentNavButton(label: "B", number: "1", text: descriptions[1], destination: ExperimentC(isHard: true))
                ExperimentNavButton(label: "B", number: "2", text: descriptions[1], destination: ExperimentC(isHard: false))
                NavigationLink(
                    destination:  QuestionsAfter1(),
                    label: {
                        Text("事後アンケート1").padding().background(Color.blue).foregroundColor(.white).cornerRadius(8)
                    })
                NavigationLink(
                    destination:  QuestionsAfter2(),
                    label: {
                        Text("事後アンケート2").padding().background(Color.blue).foregroundColor(.white).cornerRadius(8)
                    })
                Spacer()
                
            }.padding(40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExperimentNavButton<Destination>: View where Destination: View{
    var label: String
    var number: String
    var text: String
    var destination: Destination
    private var title: String {
        "実験 \(label)-\(number)"
    }
    
    var body: some View {
        NavigationLink(
            destination:  DescriptionBeforeExperiment(text: text, content: destination).navigationBarTitle(title) ,
            label: {
                Text(title).padding().background(Color.blue).foregroundColor(.white).cornerRadius(8)
            })
    }
}

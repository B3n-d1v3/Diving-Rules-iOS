//
//  PenaltyJudgeOpinionButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 18/03/2021.
//

import SwiftUI

struct PenaltyJudgeOpinionButton: View {
    @State var isOn: Bool
    
    var body: some View {
    Button(action: {
        isOn.toggle()
   }) {
        VStack {
            Image (systemName: "plusminus.circle")
            .resizable()
                .frame(width: 40.0, height: 40.0)
            Text ("Button-judgeOpinion")
                .font(.caption)
        }
        .frame(width: 80.0)
       .padding(.all, 10.0)
       .foregroundColor((isOn ? Color("AccentColor") : Color.secondary))
       }
}

}

struct PenaltyJudgeOpinionButton_Previews: PreviewProvider {
    static var previews: some View {
        PenaltyJudgeOpinionButton(isOn: true)
    }
}

//
//  PenaltyMinusTwoPtsButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 18/03/2021.
//

import SwiftUI

struct PenaltyMinusTwoPtsButton: View {
    @State var isOn: Bool
    
    var body: some View {
    Button(action: {
        isOn.toggle()
   }) {
        VStack {
            Image (systemName: "gobackward.minus")
                .resizable()
                .frame(width: 40.0, height: 40.0)
            Text ("Button--2pts")
                .font(.caption)
        }
       .frame(width: 80.0)
       .padding(.all, 10.0)
       .foregroundColor((isOn ? Color("AccentColor") : Color.secondary))
       }
}

}

struct PenaltyMinusTwoPtsButton_Previews: PreviewProvider {
    static var previews: some View {
        PenaltyMinusTwoPtsButton(isOn: true)
    }
}

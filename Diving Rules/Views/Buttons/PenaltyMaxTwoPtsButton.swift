//
//  PenaltyMaxTwoPtsButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 18/03/2021.
//

import SwiftUI

struct PenaltyMaxTwoPtsButton: View {
    @State var isOn: Bool
    
    var body: some View {
         Button(action: {
            isOn.toggle()
        }) {
            VStack {
                Image (systemName: "lessthan.circle.fill")
                    .resizable()
                    .frame(width: 40.0, height: 40.0)
                Text ("Button-max2pts")
                    .font(.caption)
            }
            .frame(width: 80.0)
            .padding(.all, 10.0)
            .foregroundColor((isOn ? Color("AccentColor") : Color.secondary))
            }
    }
    
}

struct PenaltyMaxTwoPtsButton_Previews: PreviewProvider {
    static var previews: some View {
        PenaltyMaxTwoPtsButton(isOn: true)
    }
}





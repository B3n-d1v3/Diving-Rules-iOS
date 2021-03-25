//
//  PenaltyMinusHalfToTwoPtsButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 18/03/2021.
//

import SwiftUI

struct PenaltyMinusHalfToTwoPtsButton: View {
    @State var isSet: Bool
    
    var body: some View {
    Button(action: {
           isSet.toggle()
   }) {
        VStack {
            Image (systemName: "arrow.left.and.right.circle")
            .resizable()
                .frame(width: 40.0, height: 40.0)
            Text ("Button--halfto2pts")
                .font(.caption)
        }
        .frame(width: 80.0)
        .padding(.all, 10.0)
        .foregroundColor((isSet ? Color("AccentColor") : Color.gray))
       }
}

}

struct PenaltyMinusHalfToTwoPtsButton_Previews: PreviewProvider {
    static var previews: some View {
        PenaltyMinusHalfToTwoPtsButton(isSet: true)
    }
}





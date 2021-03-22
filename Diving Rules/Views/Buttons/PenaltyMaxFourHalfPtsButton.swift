//
//  PenaltyMaxFourHalfPtsButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 18/03/2021.
//

import SwiftUI

struct PenaltyMaxFourHalfPtsButton: View {
    @State var isSet: Bool
    
    var body: some View {
         Button(action: {
                isSet.toggle()
        }) {
            VStack {
                Image (systemName: "lessthan.circle")
                    .resizable()
                    .frame(width: 40.0, height: 40.0)
                Text ("Button-max4halfpts")
                    .font(.caption)
            }
            .frame(width: 80.0)
            .padding(.all, 10.0)
            .foregroundColor((isSet ? Color.blue : Color.gray))
            }
    }
    
}

struct PenaltyMaxFourHalfPtsButton_Previews: PreviewProvider {
    static var previews: some View {
        PenaltyMaxFourHalfPtsButton(isSet: true)
    }
}



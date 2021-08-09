//
//  StickerPassed.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 07/04/2021.
//

import SwiftUI

struct StickerPassed: View {
    var body: some View {
        ZStack {
            Image (systemName: "shield.fill")
                .resizable()
                .frame(width: 95.0, height: 110.0)
                .foregroundColor(.green)
            VStack {
                Image (systemName: "checkmark.circle")
                    .resizable()
                    .frame(width: 40.0, height: 40.0)
                Text ("Passed")
                    .font(.body)
                    .fontWeight(.heavy)
            }
            .frame(width: 80.0)

            .padding(.all, 10.0)
            .foregroundColor(Color.white)
        }
    }
}

struct StickerPassed_Previews: PreviewProvider {
    static var previews: some View {
        StickerPassed()
    }
}

//
//  StickerFailed.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 07/04/2021.
//

import SwiftUI

struct StickerFailed: View {
    var body: some View {
        ZStack {
            Image (systemName: "shield.fill")
                .resizable()
                .frame(width: 95.0, height: 110.0)
                .foregroundColor(.red)
            VStack {
                Image (systemName: "xmark.octagon.fill")
                    .resizable()
                    .frame(width: 40.0, height: 40.0)
                Text ("Failed")
                    .font(.title3)
                    .fontWeight(.heavy)
            }
            .frame(width: 80.0)

            .padding(.all, 10.0)
            .foregroundColor(Color.white)
        }
    }
}

struct StickerFailed_Previews: PreviewProvider {
    static var previews: some View {
        StickerFailed()
    }
}

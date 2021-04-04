//
//  StickerWrong.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 03/04/2021.
//

import SwiftUI

struct StickerWrong: View {
    var body: some View {
        ZStack {
            Image (systemName: "shield.fill")
                .resizable()
                .frame(width: 85.0, height: 100.0)
                .foregroundColor(.red)
            VStack {
                Image (systemName: "xmark.octagon.fill")
                    .resizable()
                    .frame(width: 40.0, height: 40.0)
                Text ("Wrong")
                    .font(.title3)
                    .fontWeight(.heavy)
            }
            .frame(width: 80.0)

            .padding(.all, 10.0)
            .foregroundColor(Color.white)
        }
    }
}

struct StickerWrong_Previews: PreviewProvider {
    static var previews: some View {
        StickerWrong()
    }
}

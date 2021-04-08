//
//  Sticker.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 07/04/2021.
//

import SwiftUI

struct Sticker: View {
    var stickerImage: String
//    var stikerColor: Int
    var stickerText: String
    var body: some View {
        ZStack {
            Image (systemName: "shield.fill")
                .resizable()
                .frame(width: 85.0, height: 100.0)
//            if stickerColor == 0 {
                .foregroundColor(.green)
//                .foregroundColor(.orange)
//                .foregroundColor(.red)
//            }
            VStack {
                Image (systemName: stickerImage)
                    .resizable()
                    .frame(width: 40.0, height: 40.0)
                Text (stickerText)
                    .font(.title3)
                    .fontWeight(.heavy)
            }
            .frame(width: 80.0)

            .padding(.all, 10.0)
            .foregroundColor(Color.white)
        }
    }
}

struct Sticker_Previews: PreviewProvider {
    static var previews: some View {
        Sticker(stickerImage: "checkmark.circle", stickerText: "Good")
    }
}

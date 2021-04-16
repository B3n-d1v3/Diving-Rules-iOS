//
//  AppTitleView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 15/04/2021.
//

import SwiftUI

struct AppTitleView: View {
    var body: some View {
            HStack {
                Spacer ()
                DiverLogo()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("AccentColor"))
                Text("CFBundleName")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(Color("AccentColor"))
                Spacer ()
        }
    }
}

struct AppTitleView_Previews: PreviewProvider {
    static var previews: some View {
        AppTitleView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

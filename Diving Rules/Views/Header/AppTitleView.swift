//
//  AppTitleView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 15/04/2021.
//

import SwiftUI

struct AppTitleView: View {
    // A header to use throuout the app
    // Not yet used
    var body: some View {
        HStack {
            Spacer ()
            DiverLogo()
                .frame(width: 25, height: 25)
                .foregroundColor(Color("AccentColor"))
            Text("CFBundleName")
                .font(.title3)
                .fontWeight(.bold)
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

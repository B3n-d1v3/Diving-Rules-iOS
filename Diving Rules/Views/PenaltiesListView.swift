//
//  PenaltiesListView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import SwiftUI

struct PenaltiesListView: View {
    var body: some View {
        NavigationView {
            List (penalties) { penalty in
                NavigationLink(destination: PenaltyDetailView(penalty: penalty)) {
                    PenaltyRowView (penalties: penalty)
                    //PenaltyRowView (penalties: penalty, sanctions: sanction)
                }
            }
//            .navigationTitle("Penalties-List-Title")
            Spacer ()
        }
}
}

struct PenaltiesListView_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max", "iPad (5th generation)"], id: \.self) { deviceName in
            //show light & dark mode
            ForEach(ColorScheme.allCases, id: \.self) {
                
                PenaltiesListView()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
                    .preferredColorScheme($0)
            }
        }
    }
}


/// The following values are supported:
///
///     "Mac"
///     "iPhone 7"
///     "iPhone 7 Plus"
///     "iPhone 8"
///     "iPhone 8 Plus"
///     "iPhone SE"
///     "iPhone X"
///     "iPhone Xs"
///     "iPhone Xs Max"
///     "iPhone Xʀ"
///     "iPad mini 4"
///     "iPad Air 2"
///     "iPad Pro (9.7-inch)"
///     "iPad Pro (12.9-inch)"
///     "iPad (5th generation)"
///     "iPad Pro (12.9-inch) (2nd generation)"
///     "iPad Pro (10.5-inch)"
///     "iPad (6th generation)"
///     "iPad Pro (11-inch)"
///     "iPad Pro (12.9-inch) (3rd generation)"
///     "iPad mini (5th generation)"
///     "iPad Air (3rd generation)"
///     "Apple TV"
///     "Apple TV 4K"
///     "Apple TV 4K (at 1080p)"
///     "Apple Watch Series 2 - 38mm"
///     "Apple Watch Series 2 - 42mm"
///     "Apple Watch Series 3 - 38mm"
///     "Apple Watch Series 3 - 42mm"
///     "Apple Watch Series 4 - 40mm"
///     "Apple Watch Series 4 - 44mm"

//
//  PenaltyRowView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import SwiftUI

struct PenaltyRowView: View {
    var penalties: Penalty
    @EnvironmentObject var language: LanguageSettings
    
    var body: some View {
        // show one line of penalty

        HStack {
            Image (systemName: sanctions[penalties.sanctionValue].icon)
            .font(.title)
            .foregroundColor(Color.accentColor)

//            Text(penalties.description)
            // Using tranlated penalty desciprion
            let penaltyDescription = "Penalty-" + String(penalties.id)
            
            // Allow PenaltyDescription language selection
            let pathLanguage = Bundle.main.path(forResource: language.current, ofType: "lproj")
            let bundleLanguage = Bundle(path: pathLanguage!)
            let penaltyDescriptionTranslation = bundleLanguage?.localizedString(forKey: penaltyDescription, value: nil, table: nil)
            
            Text(penaltyDescriptionTranslation!)
            
//            Text(LocalizedStringKey(penaltyDescription))
            Spacer ()
        } // end HStack
        .padding(.all, 5.0)
    }
}

struct PenaltyRowView_Previews: PreviewProvider {
    static var previews: some View {
        PenaltyRowView(penalties: penalties [0])
            .previewLayout(.sizeThatFits)
    }
}

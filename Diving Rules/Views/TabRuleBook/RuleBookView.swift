//
//  RuleBookPdfView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 17/07/2021.
//

import SwiftUI

struct RuleBookView: View {
    @EnvironmentObject var language: LanguageSettings
    
    var body: some View {
        VStack {
            // Loads the pdf file in the dedicated language
            RuleBookPdfView ()
//            RuleBookPdfView (currentLanguage: $language.current)
        }
        // Adds the app logo to the header
        .toolbar {
            ToolbarItem(placement: .principal) {
                AppTitleView()
            }
            // Adds Flag in the header
            ToolbarItem(placement: .automatic) {
                if language.app != "en" {
                    Button {
                        if (language.current != "en"){
                            language.current = "en"
                        } else {
                            language.current = language.app
                        }
                    } label: {
                        // Show the current language
                        Text(selectFlag(of:language.current))
                    } // en Button Label
                } // end if
            }
        } // Toolbar
    }
}

struct RuleBookView_Previews: PreviewProvider {
    static var previews: some View {
        RuleBookPdfView()
    }
}

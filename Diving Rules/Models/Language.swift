//
//  Language.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 10/11/2021.
//

import Foundation
import SwiftUI
import Combine

// the Language object
class LanguageSettings: ObservableObject {
    @Published var app = findLanguage()
    @Published var current = findLanguage()
    @Published var englishFlag = "🇬🇧"
}

func findLanguage() -> String {
    // returns the language used by the app including Latin America (set to Mx)
    var currentLanguage = "en"
    currentLanguage = Locale.autoupdatingCurrent.languageCode!
//    if (currentLanguage == "es") && (Bundle.main.preferredLocalizations[0] == "es-419"){
//        currentLanguage = "mx"
//    }
    return currentLanguage
}

func selectFlag (of languageId: String) -> String {
    // returns the emojy flag of the dedicated language
    var selectedFlag = ""
    
    switch languageId {
    case "en":
        selectedFlag = "🇬🇧"
    case "fr":
        selectedFlag = "🇫🇷"
    case "it":
        selectedFlag = "🇮🇹"
    case "es":
        selectedFlag = "🇪🇸"
        if Bundle.main.preferredLocalizations[0] == "es-419" {
            selectedFlag = "🇲🇽"
        }
    case "mx":
        selectedFlag = "🇲🇽"
    default:
        selectedFlag = ""
    } // Switch
    
    return selectedFlag
} // selectFlag


// Language swap information found at https://stackoverflow.com/questions/27879232/force-nslocalizedstring-to-use-a-specific-language-using-swift/27879342#27879342
//
//        let language = "en"
//        let path = Bundle.main.path(forResource: language, ofType: "lproj")
//        let bundle = Bundle(path: path!)
//        let string = bundle?.localizedStringForKey("key", value: nil, table: nil)
//
//        or
//
//        let language = "fr"
//        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
//        let bundle = Bundle(path: path)!
//        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")



// Flag correspondance
//Text("🇺🇸") -> us
//Text("🇬🇧") -> uk
//Text("🇫🇷") -> fr
//Text("🇮🇹") -> it
//Text("🇪🇸") -> sp
//Text("🇲🇽") -> mx

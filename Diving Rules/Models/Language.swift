//
//  Language.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 10/11/2021.
//

import Foundation

func findLanguage() -> String {
    var currentLanguage = "en"
    currentLanguage = Locale.autoupdatingCurrent.languageCode!
    if (currentLanguage == "es") && (Bundle.main.preferredLocalizations[0] == "es-419"){
        currentLanguage = "mx"
    }
    return currentLanguage
}

func selectFlag (of languageId: String) -> String {
    var selectedFlag = ""
    
    switch languageId {
    case "en":
        selectedFlag = "🇺🇸"
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



//Text("🇺🇸") -> us
//Text("🇫🇷") -> fr
//Text("🇮🇹") -> it
//Text("🇪🇸") -> sp
//Text("🇲🇽") -> mx

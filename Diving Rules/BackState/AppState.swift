//
//  File.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 13/07/2021.
//

import SwiftUI
import Combine

// This file was created to deal with the exit of the quizz
// Using the following source: https://thinkdiff.net/swiftui-how-to-pop-to-tabview-from-navigationview-fe760dee04d



class AppState: ObservableObject {
    func reloadDashboard() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.reloadDashboard()
    }
}

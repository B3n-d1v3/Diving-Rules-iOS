//
//  SceneDelegate.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 13/07/2021.
//

import Foundation

// This file was created to deal with the exit of the quizz
// Using the following source: https://thinkdiff.net/swiftui-how-to-pop-to-tabview-from-navigationview-fe760dee04d


var window: UIWindow?
    var contentView: ContentView?
    var appState: AppState?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            reloadDashboard()
        }
    }

    func reloadDashboard() {
        if let window = self.window {
            window.rootViewController = UIHostingController(rootView:
                contentView
                    .environmentObject(appState!)
            )
            window.makeKeyAndVisible()
        }
    }

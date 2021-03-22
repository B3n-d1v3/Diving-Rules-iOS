//
//  Diving_RulesApp.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import SwiftUI

@main
struct Diving_RulesApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    RuleBookView()
                }
                .tabItem {
                    Image (systemName: "book")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                    Text ("Navigation-Menu-Rules")
                }
                
                NavigationView {
                    PenaltiesListView()
                }
                .tabItem {
                    Image (systemName: "square.fill.text.grid.1x2")
                    Text ("Navigation-Menu-Penalties")
                }
                
                NavigationView {
                   // QuizzQuestionView(quizzQuestion: <#T##QuizzQuestion#>)
                }
                .tabItem {
                    Image (systemName: "checkmark")
                    Text ("Navigation-Menu-Quizz")
                }
                NavigationView {
                    SearchView()
                }
                .tabItem {
                    Image (systemName: "magnifyingglass")
                    Text ("Navigation-Menu-Search")
                }
                //.environmentObject(sanctions)
                //.environmentObject(quizzQuestions)
            }
            
        }
    }
}

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    try! FileManager.default.removeItem(atPath: NSHomeDirectory()+"/Library/SplashBoard")

    do {
        sleep(5)
    }

    return true
}

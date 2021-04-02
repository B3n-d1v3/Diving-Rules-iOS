//
//  Diving_RulesApp.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import SwiftUI

@main
struct Diving_RulesApp: App {
//    environment penalties: Penalty
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    RuleBookView()
                        .navigationBarTitle("RuleBook-Title", displayMode: NavigationBarItem.TitleDisplayMode.inline)
                }
                .tabItem {
                    Image (systemName: "book")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                    Text ("Navigation-Menu-Rules")
                }
                
                NavigationView {
                    PenaltiesListView()
                        .navigationBarTitle("Penalties-List-Title")
                }
                .tabItem {
                    Image (systemName: "square.fill.text.grid.1x2")
                    Text ("Navigation-Menu-Penalties")
                }
                
                NavigationView {
                    QuizzStartView()
                        .navigationBarTitle("Quizz-Title")
                }
                .tabItem {
                    Image (systemName: "checkmark")
                    Text ("Navigation-Menu-Quizz")
                }
                NavigationView {
                    SearchView()
                        .navigationBarTitle("Search-Title")
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

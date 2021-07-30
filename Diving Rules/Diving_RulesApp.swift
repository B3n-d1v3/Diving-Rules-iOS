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
                // PDF Rule Book
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
                
                
                // Penalty explorer
                NavigationView {
                    PenaltiesListView()
                        .navigationBarTitle("Penalties-List-Title", displayMode: .inline)
                }
                .tabItem {
                    Image (systemName: "square.fill.text.grid.1x2")
                    Text ("Navigation-Menu-Penalties")
                    
                }
                
                // Quizz Access
                NavigationView {
                    QuizzStartView()
                        .navigationBarTitle("Quizz-Title", displayMode: .inline)
                }
                .tabItem {
                    Image (systemName: "checkmark")
                    Text ("Navigation-Menu-Quizz")
                }
                .navigationViewStyle(StackNavigationViewStyle())
                
                
                // About the app
                NavigationView {
                    AboutView()
                        .navigationBarTitle("About-Title", displayMode: .inline)
                }
                .tabItem {
                    Image (systemName: "info.circle")
                    Text ("About-Title")
                    
                }
                
                // Search Page
                //                NavigationView {
                //                    SearchView()
                //                        .navigationBarTitle("Search-Title")
                //                }
                //                    .tabItem {
                //                        Image (systemName: "magnifyingglass")
                //                        Text ("Navigation-Menu-Search")
                //                    }
                
            }
        }
    }
}

// to slow the splash screen so that it shows up
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    try! FileManager.default.removeItem(atPath: NSHomeDirectory()+"/Library/SplashBoard")
    
    do {
        sleep(4)
    }
    
    return true
}

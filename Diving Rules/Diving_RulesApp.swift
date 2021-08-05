//
//  File name: Diving_RulesApp.swift
//  Software name: Diving Rules
//
//  Software Description: This Mobile app is targetting the Fina Diving judges.
//  It allows the user to train and learn the Fina Diving Rules,
//  with references to the rule book and quizzes to train.
//  The mobile app has been created in multiple languages to allow users to train locally.
//
//  License: License can be found in the root of the project in the License file
//  This project has been created under GNU General Public License v3.0
//
//  Author: Created by Benoit SUZANNE on 11/03/2021.
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
                .navigationViewStyle(StackNavigationViewStyle())
                
                
                // Penalty explorer
                NavigationView {
                    PenaltiesListView()
                        .navigationBarTitle("Penalties-List-Title", displayMode: .inline)
                }
                .tabItem {
                    Image (systemName: "square.fill.text.grid.1x2")
                    Text ("Navigation-Menu-Penalties")
                    
                }
                .navigationViewStyle(StackNavigationViewStyle())
                
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
                .navigationViewStyle(StackNavigationViewStyle())
                
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

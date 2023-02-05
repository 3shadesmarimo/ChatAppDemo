//
//  ChatAppDemoApp.swift
//  ChatAppDemo
//
//  Created by Bilegt Davaa on 2022-02-25.
//

import SwiftUI
import Firebase

@main
struct ChatAppDemoApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//
//  CookLogApp.swift
//  CookLog
//
//  Created by  유 주연 on 1/12/26.
//

import SwiftUI
import SwiftData
import IQKeyboardManagerSwift

@main
struct CookLogApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            Cook.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
        
//        IQKeyboardManager.shared.isEnabled = true
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

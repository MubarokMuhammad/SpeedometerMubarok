//
//  SpeedometerMubarokApp.swift
//  SpeedometerMubarok
//
//  Created by mubarok on 2/8/25.
//

import SwiftUI

@main
struct SpeedometerMubarokApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

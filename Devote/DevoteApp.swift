//
//  DevoteApp.swift
//  Devote
//
//  Created by Ezequiel Rasgido on 14/09/2021.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared
    
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(self.isDarkMode ? .dark : .light)
        }
    }
}

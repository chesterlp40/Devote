//
//  Persistence.swift
//  Devote
//
//  Created by Ezequiel Rasgido on 14/09/2021.
//

import CoreData

struct PersistenceController {
    
    // MARK: PERSISTENT CONTROLLER - Section
    static let shared = PersistenceController()

    // MARK: PERSISTENT CONTAINER - Section
    let container: NSPersistentContainer

    // MARK: INITIALIZATION (Load the persistent store) - Section
    init(
        inMemory: Bool = false
    ) {
        container = NSPersistentContainer(name: "Devote")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    // MARK: PREVIEW - Section
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for item in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Sample task No\(item)"
            newItem.completion = false
            newItem.id = UUID()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}

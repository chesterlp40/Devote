//
//  ListRowItemView.swift
//  Devote
//
//  Created by Ezequiel Rasgido on 28/09/2021.
//

import SwiftUI

struct ListRowItemView: View {
    // MARK: PROPERTIES - Section
    
    @Environment(\.managedObjectContext) var viewContext
    
    @ObservedObject var item: Item
 
    // MARK: BODY - Section
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task  ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical, 12)
                .animation(.default)
        } //: TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange) { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        }
    }
}

//
//  Constant.swift
//  Devote
//
//  Created by Ezequiel Rasgido on 27/09/2021.
//

import SwiftUI

// MARK: FORMATTER - Section

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: UI - Section

var backgroundGradient: LinearGradient {
    return LinearGradient(
        gradient: Gradient(colors: [Color.pink, Color.blue]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

// MARK: UX - Section

let feedback = UINotificationFeedbackGenerator()

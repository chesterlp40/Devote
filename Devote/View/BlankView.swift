//
//  BlankView.swift
//  Devote
//
//  Created by Ezequiel Rasgido on 28/09/2021.
//

import SwiftUI

struct BlankView: View {
    // MARK: PROPERTIES - Section
    
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    // MARK: BODY - Section
    var body: some View {
        VStack {
            Spacer()
        } //: VSTACK
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .background(backgroundColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: PREVIEW - Section
struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
            .background(BackgroundImageView())
            .background(backgroundGradient.ignoresSafeArea(.all))
    }
}

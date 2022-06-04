//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Ezequiel Rasgido on 27/09/2021.
//

import SwiftUI

struct BackgroundImageView: View {
    // MARK: PROPERTIES - Section
    
    // MARK: BODY - Section
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

// MARK: PREVIEW - Section
struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
            .previewLayout(.device)
            .padding()
    }
}

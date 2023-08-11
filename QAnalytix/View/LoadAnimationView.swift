//
//  
//  LoadAnimationView.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
//

import SwiftUI

struct LoadAnimationView: View {
        var body: some View {
            VStack {
                LoaderView(tintColor: .blue, scaleSize: 3.0).padding(.bottom,50)
            }
        }
}

struct LoadAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LoadAnimationView()
    }
}

struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}

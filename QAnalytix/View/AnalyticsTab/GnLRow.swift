//
//  GnLRow.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 14.08.2023.
//

import SwiftUI

struct GnLRow: View {
    let portrait: String
    let isGainer: Bool
    let name: String
    let isMale: Bool
    let pair: String
    let flags: String
    let money: Double
    let percent: String
    
    var body: some View {
        HStack {
            Image(portrait)
                .resizable()
                .scaledToFit()
                .frame(height: 50)
            VStack(alignment: .leading) {
                Text(name)
                    .padding(.bottom, -6)
                    .customText(style: .bold, size: 16, color: .white)
                HStack(alignment: .center, spacing: 4) {
                    Image(flags)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 32)
                    Text(pair)
                        .customText(style: .regular, size: 14, color: .white)
                }
                .padding(.horizontal, 8)
                .frame(minHeight: 38, alignment: .leading)
                .background(Color(red: 0.35, green: 0.37, blue: 0.47))
                .cornerRadius(40)
            }
            Spacer()
            Text("\(String(format: "%.2f", money)) USD")
                .customText(style: .regular, size: 14, color: .white)
                .padding(8)
            Spacer()
            Text(percent)
                .customText(style: .bold, size: 14, color: .white)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .frame(width: 85, alignment: .center)
                .background(isGainer ? Color(red: 0.36, green: 0.8, blue: 0.32) : Color(red: 0.87, green: 0.32, blue: 0.32))
                .cornerRadius(8)
        }
    }
}

struct GnLRow_Previews: PreviewProvider {
    static var previews: some View {
        GnLRow(portrait: "male3", isGainer: false, name: "Billy", isMale: true, pair: "EUR/USD", flags: "EURUSD", money: 10.90, percent: "+40.69%")
    }
}

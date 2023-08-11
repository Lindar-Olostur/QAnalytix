//
//  SignalRow.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 16.08.2023.
//

import SwiftUI

struct SignalRow: View {
    let pair: String
    let flags: String
    let time: Date
    let isSell: Bool
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    @State var formattedString: String = ""
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(flags)
                .resizable()
                .scaledToFit()
                .frame(height: 32)
            Text(pair)
                .customText(style: .bold, size: 16, color: .white)
            Spacer()
            Text("\(formattedString)")
                .customText(style: .regular, size: 14, color: .white)
            Spacer()
            Image(systemName: "chevron.right.2")
                .rotationEffect(.degrees(isSell ? 90 : -90))
                .foregroundColor(isSell ? Color(red: 0.87, green: 0.32, blue: 0.32) : Color(red: 0.36, green: 0.8, blue: 0.32))
            Text(isSell ? "Sell" : "Buy")
                .customText(style: .regular, size: 16, color: isSell ? Color(red: 0.87, green: 0.32, blue: 0.32) : Color(red: 0.36, green: 0.8, blue: 0.32))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .frame(width: .infinity, alignment: .leading)
        .background(Color(red: 0.21, green: 0.23, blue: 0.3))
        .cornerRadius(8)
        .overlay(
        RoundedRectangle(cornerRadius: 8)
        .inset(by: 0.5)
        .stroke(Color(red: 0.16, green: 0.18, blue: 0.25), lineWidth: 1)
        )
        .onAppear {
            formattedString = dateFormatter.string(from: time)
        }
    }
}

struct SignalRow_Previews: PreviewProvider {
    static var previews: some View {
        SignalRow(pair: "EUR/USD", flags: "EURUSD", time: Date(), isSell: true)
    }
}

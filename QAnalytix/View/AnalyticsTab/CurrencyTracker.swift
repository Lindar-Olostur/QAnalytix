//
//  CurrencyTracker.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 12.08.2023.
//

import SwiftUI

struct CurrencyTracker: View {
    let image: String
    let text: String
    var currentVol: Double
    var lastVol: Double
    let grad1: Color
    let grad2: Color
    var width: Double
    var body: some View {
        ZStack {
            HStack {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: width, height: 38)
                  .background(
                    LinearGradient(
                      stops: [
                        Gradient.Stop(color: grad1, location: 0.00),
                        Gradient.Stop(color: grad2, location: 1.00),
                      ],
                      startPoint: UnitPoint(x: -0.07, y: 0.5),
                      endPoint: UnitPoint(x: 1, y: 0.5)
                    )
                  )
                  .cornerRadius(30)
                HStack {
                    Text("\(String(format: "%.2f", currentVol))%")
                        .customText(style: .bold, size: 14, color: textColor(for: currentVol, lastVol))
                        .padding(.trailing, -4)
                    if textColor(for: currentVol, lastVol) == Color(red: 0.87, green: 0.32, blue: 0.32) {
                        Image(systemName: "chevron.left.2")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color(red: 0.87, green: 0.32, blue: 0.32))
                    }
                    if textColor(for: currentVol, lastVol) == Color(red: 0.36, green: 0.8, blue: 0.32) {
                        Image(systemName: "chevron.right.2")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color(red: 0.36, green: 0.8, blue: 0.32))
                    }
                }
                Spacer()
            }
              .offset(x: 75)
            HStack {
                HStack(alignment: .center, spacing: 4) {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                    Text(text)
                        .customText(style: .regular, size: 14, color: .white)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .frame(minHeight: 38, alignment: .leading)
                .background(Color(red: 0.35, green: 0.37, blue: 0.47))
                .cornerRadius(40)
                Spacer()
            }
        }
    }
    private func textColor(for currentVol: Double, _ lastVol: Double) -> Color {
            if currentVol > lastVol {
                return Color(red: 0.36, green: 0.8, blue: 0.32)
            } else if currentVol < lastVol {
                return Color(red: 0.87, green: 0.32, blue: 0.32)
            } else {
                return .white
            }
        }
}

struct CurrencyTracker_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyTracker(image: "EURUSD", text: "EUR/USD", currentVol: 34.56, lastVol: 33.00, grad1: Color(red: 0.26, green: 0.67, blue: 0.9), grad2: Color(red: 0.09, green: 0.39, blue: 0.97), width: 148)
    }
}

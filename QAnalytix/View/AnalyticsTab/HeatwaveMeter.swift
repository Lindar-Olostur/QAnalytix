//
//  HeatwaveMeter.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 13.08.2023.
//

import SwiftUI

struct HeatwaveMeter: View {
    let value = Double.random(in: 0.01..<9.99)
    let image: String
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack {
                ZStack {
                    Image("HeatwaveMeter")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 66)
                        .padding()
                    Image("Arrow1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 58)
                        .offset(y: 10)
                        .rotationEffect(.degrees(-87), anchor: .bottom)
                        .rotationEffect(calculateArrowAngle(value: value), anchor: .bottom)
                }
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(Color("bg"))
            }
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                Text(text)
                    .customText(style: .regular, size: 14, color: .white)
                Spacer()
                Text("\(String(format: "%.2f", value))")
                    .customText(style: .bold, size: 14, color: .white)
            }
            .padding(8)
        }
        .padding(0)
        .background(Color(red: 0.21, green: 0.23, blue: 0.3))
        .cornerRadius(8)
    }
    func calculateArrowAngle(value: Double) -> Angle {
            let maxSpeed: Double = 9.9
            let angleRange: Double = 170.0 // Диапазон углов поворота стрелки
            let anglePerUnit = angleRange / maxSpeed
            
            let angle = min(angleRange, max(0, value * anglePerUnit))
            return Angle(degrees: angle)
        }
}

struct HeatwaveMeter_Previews: PreviewProvider {
    static var previews: some View {
        HeatwaveMeter(image: "EURUSD", text: "EUR/USD")//value: 10)
    }
}

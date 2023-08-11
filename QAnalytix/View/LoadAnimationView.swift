//
//  LoadAnimationView.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 12.08.2023.
//

import SwiftUI

struct RingWithAnimatedProgress: View {
    let segmentsCount = 12
    let segmentWidth: CGFloat = 35
    let gapAngle: Double = 6 // Угол зазора между сегментами
    @Binding var animationDuration: Double
    
    @Binding var progress: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<12) { index in
                    let segmentColor = self.getSegmentColor(index: index)
                    
                    let startAngle = Angle(degrees: Double(index) * (360.0 / Double(self.segmentsCount)))
                    let endAngle = Angle(degrees: Double(index + 1) * (360.0 / Double(self.segmentsCount)) - self.gapAngle) // Вычитаем угол зазора
                    
                    Path { path in
                        path.addArc(center: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2),
                                    radius: (geometry.size.width - self.segmentWidth) / 2,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: false)
                    }
                    .stroke(self.progress != 12 ? segmentColor : Color("blueBTN"), lineWidth: self.segmentWidth)
                }
                
                Text("\(Int(ceil(8.3 * Float(progress))))%") // Отображение прогресса в центре кольца
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(width: geometry.size.width, height: geometry.size.height) // Регулирование размера кольца
        }
    }
    private func getSegmentColor(index: Int) -> Color {
        if index < self.progress {
            return Color("Contentsecondary")
        } else {
            return Color.clear
        }
    }
}

 



struct ContentView: View {
    var body: some View {
        RingWithAnimatedProgress(animationDuration: .constant(0.2), progress: .constant(0))
            .frame(width: 156, height: 154)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


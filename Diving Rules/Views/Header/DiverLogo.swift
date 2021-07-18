//
//  DiverLogo.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 15/04/2021.
//

import SwiftUI

struct DiverLogo: Shape {
    // An svg version of the diver app pictogram
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            path.addEllipse(in: CGRect(x: 0.68688*width, y: 0, width: 0.31312*width, height: 0.29417*height))
            path.move(to: CGPoint(x: 0.80439*width, y: 0.46296*height))
            path.addCurve(to: CGPoint(x: 0.65354*width, y: 0.49019*height), control1: CGPoint(x: 0.77379*width, y: 0.50892*height), control2: CGPoint(x: 0.70626*width, y: 0.52109*height))
            path.addCurve(to: CGPoint(x: 0.03236*width, y: 0.00983*height), control1: CGPoint(x: 0.60081*width, y: 0.45928*height), control2: CGPoint(x: 0.03236*width, y: 0.00983*height))
            path.addCurve(to: CGPoint(x: 0.76424*width, y: 0.32366*height), control1: CGPoint(x: 0.03236*width, y: 0.00983*height), control2: CGPoint(x: 0.71156*width, y: 0.29271*height))
            path.addCurve(to: CGPoint(x: 0.80439*width, y: 0.46296*height), control1: CGPoint(x: 0.81692*width, y: 0.3546*height), control2: CGPoint(x: 0.83491*width, y: 0.41698*height))
            path.closeSubpath()
            path.move(to: CGPoint(x: 0.79277*width, y: 0.97356*height))
            path.addCurve(to: CGPoint(x: 0.56753*width, y: 0.93127*height), control1: CGPoint(x: 0.72841*width, y: 1.02144*height), control2: CGPoint(x: 0.62756*width, y: 1.0025*height))
            path.addCurve(to: CGPoint(x: 0, y: 0.04069*height), control1: CGPoint(x: 0.5075*width, y: 0.86004*height), control2: CGPoint(x: 0.41356*width, y: 0.60623*height))
            path.addCurve(to: CGPoint(x: 0.80062*width, y: 0.75789*height), control1: CGPoint(x: 0.12728*width, y: 0.13979*height), control2: CGPoint(x: 0.74058*width, y: 0.68666*height))
            path.addCurve(to: CGPoint(x: 0.79277*width, y: 0.97356*height), control1: CGPoint(x: 0.86065*width, y: 0.82912*height), control2: CGPoint(x: 0.85714*width, y: 0.92569*height))
            path.closeSubpath()
            return path
        }
    }

struct DiverLogo_Previews: PreviewProvider {
    static var previews: some View {
        DiverLogo()
            .padding()
            .frame(width: 500, height: 500)
            .previewLayout(.sizeThatFits)
    }
}

//
//  Skeleton.swift
//  Cinemate
//
//  Created by Avishka Kapuruge on 2023-12-25.
//

import SwiftUI

public struct Skeleton: View {
    private struct Constants {
        static let duration: Double = 0.9
        static let minOpacity: Double = 0.30
        static let maxOpacity: Double = 1.0
    }
    @State private var opacity: Double = Constants.minOpacity
    let cornerRadius: CGFloat
    let width: CGFloat
    let height: CGFloat
    public init(cornerRadius: CGFloat, width: CGFloat, height: CGFloat) {
        self.cornerRadius = cornerRadius
        self.width = width
        self.height = height
    }
    public var body : some View{
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(Color("Smoke"))
            .opacity(opacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                DispatchQueue.main.async {
                    withAnimation(repeated) {
                        self.opacity = Constants.maxOpacity
                    }
                }
            }.frame(width: width, height: height)
    }
}


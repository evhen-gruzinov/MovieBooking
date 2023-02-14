//
// Created by Evhen Gruzinov on 15.02.2023.
//

import SwiftUI

struct BackgroundAnimation: View {
    @State var animate = false

    var body: some View {
        CircleBackground(color: Color("greenCircle"))
                .blur(radius: animate ? 30 : 100)
                .offset(x: animate ? -50 : -130, y:animate ? -30 : -100)
                .task {
                    withAnimation(.easeOut(duration: 7).repeatForever()) {
                        animate.toggle()
                    }
                }

        CircleBackground(color: Color("pinkCircle"))
                .blur(radius: animate ? 30 : 100)
                .offset(x: animate ? -100 : -130, y:animate ? -150 : -100)
    }
}

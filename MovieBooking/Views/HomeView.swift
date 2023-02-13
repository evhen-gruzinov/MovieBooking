//
//  HomeView.swift
//  MovieBooking
//
//  Created by Evhen Gruzinov on 13.02.2023.
//

import SwiftUI

struct HomeView: View {
    @State var animate = false
    
    var body: some View {
        ZStack {
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
            
            
            VStack (spacing: 0) {
                Text("Choose movie")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                CustomSearchBar()
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20))
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20.0) {
                        ScrollSection(title: "Now Playing", posters: posters1)
                        ScrollSection(title: "Comming soon", posters: posters2)
                        ScrollSection(title: "Top Movies", posters: posters3)
                        ScrollSection(title: "Favorite", posters: posters1)
                    }
                    .padding(.bottom, 90)
                }
            }
            .padding(5)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

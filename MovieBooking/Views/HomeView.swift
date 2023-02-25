//
//  Created by Evhen Gruzinov on 13.02.2023.
//

import SwiftUI

struct HomeView: View {
    let movies: [Movie]
    
    var body: some View {
        ZStack {
            BackgroundAnimation()

            VStack (spacing: 0) {
                Text("Choose movie")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
//                CustomSearchBar()
//                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20))
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20.0) {
                        HorizontalScrollSection(title: "Now Playing", movies: movies.filter({$0.status == .available}) )
                        HorizontalScrollSection(title: "Coming soon", movies: movies.filter({$0.status == .coming}) )
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
        HomeView(movies: sampleMovies)
    }
}

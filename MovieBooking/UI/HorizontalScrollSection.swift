//
//  Created by Evhen Gruzinov on 13.02.2023.
//

import SwiftUI

struct HorizontalScrollSection: View {
    @State var title: String = "Now playing"
    @State var movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(movies, id: \.self) { movie in
                        NavigationLink {
                            MovieInfoView(movie: movie)
                        } label: {
                            Image(movie.poster)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 150)
                                .cornerRadius(20)
                        }
                        
                    }
                }
                .offset(x: 20)
                .padding(.trailing, 40)
            }
        }
    }
}

struct ScrollSection_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollSection(movies: sampleMovies)
    }
}

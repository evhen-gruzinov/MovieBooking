//
//  Created by Willie Yam on 2022-08-16.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .home
    @State var tickets: [Ticket] = sampleTickets
    @State var movies: [Movie] = sampleMovies
    
//    init() {
//        UITabBar.appearance().isHidden = true
//    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                TabView(selection: $currentTab) {
                    HomeView(movies: movies).tag(Tab.home)
                    
                    Text("Location").tag(Tab.location)
                    
                    TicketsView().tag(Tab.ticket)
//                    TicketsView(tickets: $tickets).tag(Tab.ticket)
                    
                    Text("Category").tag(Tab.category)
                    
                    Text("Profile").tag(Tab.profile)
                }
                CustomTabBar(currentTab: $currentTab)
            }
            .ignoresSafeArea(.keyboard)
        }
        .onAppear {
            
            // Loader of movies, disabled because not need now
//            MoviesStorage.load { result in
//                switch result {
//                case .success(let movies):
//                    if movies.isEmpty {
//                        self.movies = sampleMovies
//                        MoviesStorage.save(movies: sampleMovies) { result in
//                            if case .failure(let error) = result {
//                                fatalError(error.localizedDescription)
//                            }
//                        }
//                    } else {
//                        self.movies = movies
//                    }
//                case .failure(let error):
//                    fatalError(error.localizedDescription)
//                }
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

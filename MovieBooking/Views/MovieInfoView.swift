//
//  Created by Evhen Gruzinov on 13.02.2023.
//

import SwiftUI

struct MovieInfoView: View {
    @Environment(\.dismiss) var dismiss

    @State var gradient = [Color("backgroundColor2").opacity(0), Color("backgroundColor2") , Color("backgroundColor2"), Color("backgroundColor2")]
    
    
    @State var movie: Movie
    @State var selectedDate: UUID?
    @State var selectedHour: String?
    @State var bindingSelection = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(movie.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                VStack {
                    LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                        .frame(height: 600)
                }
                VStack(spacing: 0.0) {
                    HStack {
                        CircleButton(action: {
                            dismiss()
                        }, image: "arrow.left")
                        Spacer()
                        CircleButton(action: {
                            
                        }, image: "ellipsis")
                    }
                    .padding(EdgeInsets(top: 46, leading: 20, bottom: 0, trailing: 20))
                    
                    Text(movie.title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 200)
                    
                    Text(movie.subtitle)
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    Text(movie.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(30)
                    
                    
                    if movie.status == .available {
                        Text("Select date and time")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        if let schedule = movie.schedule {
                            HStack(alignment: .top, spacing: 10.0) {
                                ForEach(schedule) { item in
                                    DateButton(weekDay: "Thu", numDay: dateToStringShort(item.date), isSelected: .constant(selectedDate == Optional(item.id))) {
                                        withAnimation(.spring()) {
                                            selectedDate = item.id
                                            selectedHour = nil
                                        }
                                    }
                                }
                            }
                            if let selectedDate = selectedDate {
                                let selectedIndex = movie.schedule?.firstIndex(where: { item in
                                    item.id == selectedDate
                                })
                                if let selectedIndex = selectedIndex {
                                    let scheduleItem = schedule[selectedIndex]
                                    HStack(alignment: .top, spacing: 20.0) {
                                        ForEach(scheduleItem.time, id: \.self) { time in
                                            TimeButton(hour: time, isSelected: .constant(selectedHour == time)) {
                                                selectedHour = time
                                            }
                                        }
                                    }
                                    .padding(.top, 20)
                                }
                            }
                        }
                        
                        if selectedDate != nil, let localSelectedHour = selectedHour {
                            
                            let selectedIndex = movie.schedule?.firstIndex(where: { item in
                                item.id == selectedDate
                            })
                            if let selectedIndex = selectedIndex, let localSelectedDate = movie.schedule?[selectedIndex].date {
                                NavigationLink {
                                    SeatsView(selectedMovie: movie, seatsLayout: sampleSeatsLayout, selectedDate: localSelectedDate, selectedHour: localSelectedHour)
                                } label: {
                                    LargeButton()
                                        .padding(.horizontal, 20)
                                        .padding(.top, 25)
                                }
                            }
                        }
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .background(Color("backgroundColor2"))
        .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        MovieInfoView(movie: sampleMovies.first!)
    }
}

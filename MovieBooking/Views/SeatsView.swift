//
//  Created by Evhen Gruzinov on 14.02.2023.
//

import SwiftUI

struct SeatsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var selectedMovie: Movie
    @State var seatsLayout: CinemaHallLayout = sampleSeatsLayout
    @State var selectedDate: Date
    @State var selectedHour: String
    @State var selectedSeats: [Seat] = []
    var selectedRows: [Int: [Seat]] {
        var rows: [Int: [Seat]] = [:]
        for seat in selectedSeats {
            if rows[seat.row] == nil {
                rows[seat.row] = []
            }
            rows[seat.row]?.append(seat)
        }
        return rows
    }
    var totalCharge: Double {
        var totalCharge = 0.0
        for seat in selectedSeats {
            switch seat.type {
            case .standart: totalCharge += 5.0
            case .vip: totalCharge += 12.0
            }
        }
        return totalCharge
    }
    
    @State var animate = false
    @State var showButton = false
    
    var body: some View {
        ScrollView {
            HStack {
                CircleButton(action: { dismiss() }, image: "arrow.left")
                
                Spacer()
                
                Text("Choose seat")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                CircleButton(action: {}, image: "calendar")
            }
            .padding(.top, 46)
            .padding(.horizontal, 20)
            
            HallLayout(seatsLayout: $seatsLayout, selectedSeats: $selectedSeats)
            
            HStack(spacing: 20) {
                StatusUI(color: Color("teal"))
                StatusUI(color: Color("majenta"), text: "Reserved")
                StatusUI(color: Color("orange"), text: "Selected")
            }
            .padding(.top, 20)
            
            if !selectedSeats.isEmpty {
                ZStack(alignment: .topLeading) {
                    Circle()
                        .frame(width: 200, height: 230)
                        .foregroundColor(Color("purple"))
                        .blur(radius: animate ? 70 : 100)
                        .offset(x: animate ? -100 : 20, y: animate ? -20 : 20)
                        .task {
                            withAnimation(.easeInOut(duration: 7).repeatForever()) {
                                animate.toggle()
                            }
                        }
                    
                    Circle()
                        .frame(width: 200, height: 230)
                        .foregroundColor(Color("lightBlue"))
                        .blur(radius: animate ? 50 : 100)
                        .offset(x: animate ? 50 : 70, y: animate ? 70 : 30)
                        .task {
                            withAnimation(.easeInOut(duration: 7).repeatForever()) {
                                animate.toggle()
                            }
                        }
                    
                    Circle()
                        .frame(width: 200, height: 230)
                        .foregroundColor(Color("pink"))
                        .blur(radius: animate ? 70 : 100)
                        .offset(x: animate ? 150 : 170, y: animate ? 90 : 100)
                        .task {
                            withAnimation(.easeInOut(duration: 7).repeatForever()) {
                                animate.toggle()
                            }
                        }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        HStack(spacing: 10) {
                            Image(systemName: "calendar")
                            Text(dateToStringFull(selectedDate))
                            Circle()
                                .frame(width: 6, height: 6)
                            Text(selectedHour)
                        }
                        HStack(spacing: 10) {
                            Image(systemName: "ticket.fill")
                            VStack(alignment: .leading) {
                                ForEach(Array(selectedRows.keys.enumerated()), id: \.element) { _, key in
                                    if let seats = selectedRows[key] {
                                        let stringSeats = "Row: \(key), Seats: \(seats.map{ String($0.index) }.joined(separator: ", "))"
                                        Text(stringSeats)
                                    }
                                }
                            }
                        }
                        HStack(spacing: 10) {
                            Image(systemName: "cart.fill")
                            Text("Total: $" + String(format: "%.2f", totalCharge))
                        }
                    }
                    .padding(42)
                    .font(.subheadline)
                    
                    HStack {
                        Spacer()
                        RoundButton {
                            TicketsStorage.load { result in
                                switch result {
                                case .success(let t):
                                    var tickets = t
                                    for row in selectedRows {
                                        tickets.append(Ticket(movieID: Int(selectedMovie.movieId), date: selectedDate, time: selectedHour, row: row.key, seats: row.value.map{ $0.index }))
                                    }
                                    
                                    TicketsStorage.save(tickets: tickets) { result in
                                        if case .failure(let error) = result {
                                            fatalError(error.localizedDescription)
                                        }
                                    }
                                    
                                case .failure(let error):
                                    fatalError(error.localizedDescription)
                                }
                            }
                            NavigationUtil.popToRootView()
                        }
                    }.frame(maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .foregroundColor(.white)
                .background(.ultraThinMaterial)
                .clipped()
                .padding(.top, 50)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("backgroundColor"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct SeatsView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsView(selectedMovie: sampleMovies[0], seatsLayout: sampleSeatsLayout, selectedDate: sampleDate1, selectedHour: "19:50")
    }
}

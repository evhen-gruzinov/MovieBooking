//
//  SeatsLayout.swift
//  MovieBooking
//
//  Created by Evhen Gruzinov on 25.02.2023.
//

import SwiftUI

struct SeatsLayout: View {
    @State var row: Row
    @Binding var seatsLayout: CinemaHallLayout
    @Binding var selectedSeats: [Seat]
    
    var body: some View {
        ForEach(row.seats, id: \.self) { seat in
            if seat.isMargin {
                Rectangle()
                    .frame(width: 30, height: 22)
                    .padding(2)
                    .opacity(0)
            } else {
                Rectangle()
                    .frame(width: 30, height: 22)
                    .mask(Image("seat"))
                    .foregroundColor(seat.isBooked ? Color(.red) : (seat.isSelected ? Color("orange") : Color("teal")))
                    .padding(2)
                    .overlay {
                        Text(String(seat.index))
                            .bold()
                            .foregroundColor(.white)
                            .shadow(radius: 1)
                    }
                    .onTapGesture {
                        withAnimation {
                            seatsLayout.rows[seat.row-1].seats[seat.index-1].isSelected.toggle()
                            
                            if seatsLayout.rows[seat.row-1].seats[seat.index-1].isSelected {
                                var savingSeat = seat
                                savingSeat.isSelected = true
                                selectedSeats.append(savingSeat)
                            } else {
                                selectedSeats = selectedSeats.filter {$0 != seat}
                            }
                        }
                    }
            }
        }
    }
}

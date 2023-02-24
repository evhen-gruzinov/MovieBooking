//
//  Created by Evhen Gruzinov on 16.02.2023.
//

import SwiftUI

struct SeatsLayout: View {
    @Binding var seatsLayout: CinemaHallLayout
    @Binding var selectedSeats: [Seat]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: true) {
                Image("frontSeat")
                    .padding(.top, 55)
                    .padding(.bottom, 25)
                    .glow(color: Color("pink"), radius: 20)
                ForEach(seatsLayout.rows, id: \.self) { row in
                    HStack {
                        Text(String(row.index))
                            .foregroundColor(.white)
                            .bold()
                            .padding(.trailing)
                        ForEach(row.seats, id: \.self) { seat in
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
            .padding(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SeatsLayout_Previews: PreviewProvider {
    static var previews: some View {
        SeatsLayout(seatsLayout: .constant(sampleSeatsLayout), selectedSeats: .constant([]))
    }
}

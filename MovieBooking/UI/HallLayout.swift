//
//  Created by Evhen Gruzinov on 16.02.2023.
//

import SwiftUI

struct HallLayout: View {
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
                        SeatsLayout(row: row, seatsLayout: $seatsLayout, selectedSeats: $selectedSeats)
                    }
                }
            }
            .padding(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct HallLayout_Previews: PreviewProvider {
    static var previews: some View {
        HallLayout(seatsLayout: .constant(sampleSeatsLayout), selectedSeats: .constant([]))
    }
}

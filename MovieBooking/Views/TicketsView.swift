//
//  Created by Evhen Gruzinov on 09.02.2023.
//

import SwiftUI

struct TicketsView: View {
    @State var tickets: [Ticket] = []
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
            
            
            VStack (spacing: 25) {
                Text("Mobile ticket")
                    .font(.title3)
                    .foregroundColor(.white)
                Text("Once you buy a movie ticket simply scan the barcode to access to your movie.")
                    .font(.body)
                    .frame(maxWidth: 248)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            UITicketsStack(tickets: $tickets)
                .padding(.top, 100)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom)
        )
        .onAppear {
            TicketsStorage.load { result in
                switch result {
                case .success(let tickets):
                    self.tickets = tickets
                case .failure(let error):
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketsView()
//        TicketsView(tickets: .constant(sampleTickets))
    }
}

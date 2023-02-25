//
//  Ticket.swift
//  MovieBooking
//
//  Created by Evhen Gruzinov on 09.02.2023.
//

import SwiftUI

struct UITicket: View {
    @State var ticket: Ticket
    @State var movies: [Movie]
    var movie: Movie {getMovieFrom(id: ticket.movieID, movies: movies) ?? Movie(movieId: 0, title: "No data", subtitle: "", description: "", poster: "", image: "", status: .over, schedule: nil)}
    
    var gradient = [Color("cyan"), Color("cyan").opacity(0), Color("cyan").opacity(0)]
    
    var body: some View {
        VStack(spacing: 0.0) {
            VStack(spacing: 4.0) {
                Text(movie.title)
                    .fontWeight(.bold)
                Text(movie.subtitle)
            }
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
            .frame(width: 250, height: 325, alignment: .top)
            .foregroundColor(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(LinearGradient(colors: gradient, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
            }
            .cornerRadius(40, corners: [.topLeft, .topRight])
                        
            VStack(spacing: 10) {
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [7]))
                    .frame(width: 200, height: 1)
                    .opacity(0.6)
                
                HStack(spacing: 20) {
                    HStack(spacing: 4) {
                        Text("Date:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text(dateToStringShort(ticket.date))
                            .foregroundColor(.black)
                    }
                    HStack(spacing: 4) {
                        Text("Time:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text(ticket.time)
                            .foregroundColor(.black)
                    }
                }
                HStack(spacing: 20) {
                    HStack(spacing: 4) {
                        Text("Row:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text(String(ticket.row))
                            .foregroundColor(.black)
                    }
                    HStack(spacing: 4) {
                        Text("Seats:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text(ticket.seats.map{String($0) }.joined(separator: ", "))
                            .foregroundColor(.black)
                    }
                }
                Image("code")
            }
            .frame(width: 250, height: 135, alignment: .top)
            .background(.ultraThinMaterial)
        }
        .frame(height: 460)
        .font(.footnote)
        .shadow(radius: 10)
        .background(
            Image(movie.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .mask {
            Image("ticketMask")
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
}

struct Ticket_Previews: PreviewProvider {
    static var previews: some View {
        UITicket(
            ticket: sampleTickets[0], movies: sampleMovies
//            title: tickets[0].title, subtitle: tickets[0].subtitle, top: tickets[0].top, bottom: tickets[0].bottom, height: .constant(0)
        )
    }
}

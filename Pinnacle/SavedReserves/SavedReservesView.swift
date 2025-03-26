//
//  SavedReservesView.swift
//  Pinnacle
//
//  Created by D K on 07.03.2025.
//

import SwiftUI

struct SavedReservesView: View {
    
    @State private var reservations: [RealmReservation] = []
    @State private var isNotifShown = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.darkBlue)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50 , height: 50)
                    
                    Text("Reservations")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .black))
                    
                    Spacer()
                    
                    Button {
                        isNotifShown.toggle()
                    } label: {
                        Image(systemName: "bell")
                    }
                    .foregroundStyle(.white)
                    .padding(.trailing, 20)
                }
                .padding(.leading)
                
                if !reservations.isEmpty {
                    ScrollView {
                        ForEach(reservations, id: \.id) { reserv in
                            Rectangle()
                                .frame(width: size().width - 50, height: 150)
                                .overlay {
                                    ZStack {
                                        
                                        Image(reserv.type)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: size().width - 50, height: 150)
                                            .blur(radius: 6)
                                        
                                        Rectangle()
                                            .foregroundStyle(.black.opacity(0.4))
                                            .frame(width: size().width - 50, height: 150)
                                        
                                        
                                        VStack(spacing: 10) {
                                            Text(reserv.title)
                                                .foregroundStyle(.white)
                                                .font(.system(size: 24, weight: .thin))
                                            
                                            Text("\(reserv.date) \(reserv.time)")
                                                .foregroundStyle(.white)
                                                .font(.system(size: 20, weight: .thin))
                                            
                                            Button {
                                                openInAppleMaps(address: reserv.location)
                                            } label: {
                                                HStack {
                                                    Text(reserv.location)
                                                        .foregroundStyle(.cutsomOrange)
                                                        .font(.system(size: 20, weight: .thin))
                                                    
                                                    Image(systemName: "mappin.circle")
                                                        .foregroundStyle(.cutsomOrange)
                                                        .font(.system(size: 20, weight: .thin))
                                                }
                                            }
                                        }
                                        .multilineTextAlignment(.center)
                                    }
                                }
                                .cornerRadius(18)
                                .padding()
                                .shadow(color: .cutsomOrange, radius: 2)
                        }
                    }
                    .scrollIndicators(.hidden)
                } else {
                    VStack {
                        Spacer()
                        
                        Text("You have no active reserves.")
                            .foregroundStyle(.gray)
                            .font(.system(size: 32, weight: .ultraLight))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Image(systemName: "figure.run.square.stack")
                            .foregroundStyle(.gray)
                            .font(.system(size: 92, weight: .ultraLight))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                    }
                }
            }
        }
        .onAppear {
            reservations = Array(RealmManager.shared.reservations)
        }
        .fullScreenCover(isPresented: $isNotifShown) {
            NotificationsView()
        }
    }
    
    
    func openInAppleMaps(address: String) {
          let encodedAddress = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
          if let url = URL(string: "http://maps.apple.com/?q=\(encodedAddress)"),
             UIApplication.shared.canOpenURL(url) {
              UIApplication.shared.open(url)
          }
      }
}

#Preview {
    SavedReservesView()
}

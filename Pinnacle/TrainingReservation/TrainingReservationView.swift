//
//  TrainingReservationView.swift
//  Pinnacle
//
//  Created by D K on 10.03.2025.
//

import SwiftUI

struct TrainingReservationView: View {
    
    @Environment(\.dismiss) var dismiss
    var image: String
    var trainig: Training
    var type: String
    
    @State private var name = ""
    @State private var number = ""
    
    @State private var isAlertShown = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.darkBlue)
                .ignoresSafeArea()
            
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size().width, height: 100)
                    .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 12, bottomTrailingRadius: 12, topTrailingRadius: 0))
                    .blur(radius: 3.0)
                    .ignoresSafeArea()
                    .shadow(color: .softBlue, radius: 10, y: 10)
                    .overlay {
                        VStack {
                            HStack {
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "xmark")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 24, weight: .bold))
                                }
                                .padding(.leading)
                                
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    .overlay {
                        Text("Reservation")
                            .foregroundStyle(.white)
                            .font(.system(size: 32, weight: .thin))
                            .padding(.bottom, 30)
                    }
                
                ScrollView {
                    
                    Text("DRILL INFO:")
                        .font(.system(size: 32, weight: .thin))
                        .foregroundStyle(.white)
                    
                    Text("Training title:")
                        .foregroundStyle(.gray)
                        .font(.system(size: 16, weight: .ultraLight))
                        .frame(width: size().width - 40, alignment: .leading)
                    
                    Text(trainig.title)
                        .foregroundStyle(.white)
                        .frame(width: size().width - 40)
                        .padding(.vertical)
                        .background {
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.softBlue)
                                .shadow(color: .gray, radius: 10)
                                .cornerRadius(18)
                            
                        }
                        
                    Text("Training description:")
                        .foregroundStyle(.gray)
                        .font(.system(size: 16, weight: .ultraLight))
                        .frame(width: size().width - 40, alignment: .leading)
                    
                    Text(trainig.description)
                        .foregroundStyle(.white)
                        .frame(width: size().width - 40)
                        .padding(.vertical)
                        .background {
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.softBlue)
                                .shadow(color: .gray, radius: 10)
                                .cornerRadius(18)
                            
                        }
                    
                    Text("Date and Time:")
                        .foregroundStyle(.gray)
                        .font(.system(size: 16, weight: .ultraLight))
                        .frame(width: size().width - 40, alignment: .leading)
                    
                    Text("\(trainig.date) \(trainig.time)")
                        .foregroundStyle(.white)
                        .frame(width: size().width - 40)
                        .padding(.vertical)
                        .background {
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.softBlue)
                                .shadow(color: .gray, radius: 10)
                                .cornerRadius(18)
                            
                        }
                    
                    Text("Coach:")
                        .foregroundStyle(.gray)
                        .font(.system(size: 16, weight: .ultraLight))
                        .frame(width: size().width - 40, alignment: .leading)
                    
                    Text(trainig.coachName)
                        .foregroundStyle(.white)
                        .frame(width: size().width - 40)
                        .padding(.vertical)
                        .background {
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.softBlue)
                                .shadow(color: .gray, radius: 10)
                                .cornerRadius(18)
                            
                        }
                    
                    Text("Location:")
                        .foregroundStyle(.gray)
                        .font(.system(size: 16, weight: .ultraLight))
                        .frame(width: size().width - 40, alignment: .leading)
                    
                    Button {
                        openInAppleMaps(address: trainig.location)
                    } label: {
                        Text(trainig.location)
                            .padding(.horizontal)
                            .foregroundStyle(.cutsomOrange)
                            .frame(width: size().width - 40)
                            .padding(.vertical)
                            .background {
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(lineWidth: 2)
                                    .foregroundStyle(.softBlue)
                                    .shadow(color: .gray, radius: 10)
                                    .cornerRadius(18)
                                
                            }
                            
                    }
                  
                    
                    Text("What to bring:")
                        .foregroundStyle(.gray)
                        .font(.system(size: 16, weight: .ultraLight))
                        .frame(width: size().width - 40, alignment: .leading)
                    
                    Text(trainig.itemsToBring)
                        .foregroundStyle(.white)
                        .frame(width: size().width - 40)
                        .padding(.vertical)
                        .background {
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.softBlue)
                                .shadow(color: .gray, radius: 10)
                                .cornerRadius(18)
                            
                        }
                    
                    Text("USER INFO:")
                        .font(.system(size: 32, weight: .thin))
                        .foregroundStyle(.white)
                    
                    TextField("", text: $name, prompt: Text("Write your name"))
                        .foregroundStyle(.white)
                        .padding(.vertical)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.softBlue)
                                .shadow(color: .gray, radius: 10)
                                .cornerRadius(18)
                            
                        }
                        .frame(width: size().width - 40)
                        .padding(.bottom)
                    
                    TextField("", text: $number, prompt: Text("Phone number"))
                        .foregroundStyle(.white)
                        .padding(.vertical)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.softBlue)
                                .shadow(color: .gray, radius: 10)
                                .cornerRadius(18)
                            
                        }
                        .frame(width: size().width - 40)
                    
                    Button {
                        if !name.isEmpty {
                            isAlertShown.toggle()
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: size().width - 80, height: 65)
                            .foregroundStyle(.cutsomOrange)
                            .overlay {
                                Text("Apply")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 22, weight: .black))
                            }
                    }
                    .padding(.top)
                    .padding(.bottom, 150)
                    .disabled(name.isEmpty)
                    .disabled(number.isEmpty)
                    .opacity((name.isEmpty || number.isEmpty) ? 0.5 : 1)
                }
                .scrollIndicators(.hidden)
            }
        }
        .overlay {
            if isAlertShown {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.1))
                    
                    CustomAlert(text: "Your application has been sent. \nWe are waiting for you at the training!", seconds: 2) {
                        RealmManager.shared.saveReservation(training: trainig, type: type)
                        dismiss()
                    }
                }
                .ignoresSafeArea()
                
            }
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
    TrainingReservationView(image: "f1", trainig: DataManager.shared.football.first!, type: "")
}

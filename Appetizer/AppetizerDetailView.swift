//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Shiva on 9/8/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizerDetails: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizerDetails.imageURL)
               
                .frame(width: 300, height: 225)
            VStack {
                
                Text(appetizerDetails.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizerDetails.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                    .fontWeight(.medium)
                
                HStack(spacing: 40) {
                    VStack(spacing: 5) {
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        Text("\(appetizerDetails.calories)" + " g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack(spacing: 5) {
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        Text("\(appetizerDetails.carbs)" + " g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack(spacing: 5) {
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        Text("\(appetizerDetails.protein)" + " g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
            }
            
                
            
            Spacer()
            Button {
               print()
            } label: {
                APButton(title: "$\(appetizerDetails.price, specifier: "%.2f") - Add to Order")
            }.padding(.bottom, 30)

        }.frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 80)
            .overlay(alignment: .topTrailing) {
               
                Button(action: {
                    isShowingDetailView = false
                }, label: {
                    ZStack {
                        
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(.white))
                            .opacity(0.7)
                        Image(systemName: "xmark")
                            .imageScale(.small)
                            .frame(width: 44, height: 44)
                            .foregroundColor(.black)
                    }
                   
                })
            }
    }
}

#Preview {
    AppetizerDetailView(appetizerDetails: MockData.sampleAppetizer, isShowingDetailView: .constant(true))
}

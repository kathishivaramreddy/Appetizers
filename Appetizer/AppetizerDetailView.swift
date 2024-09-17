//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Shiva on 9/8/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
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
                    DietDetailView(title: "Calories"
                                   , description: "\(appetizerDetails.calories) g")
                    DietDetailView(title: "Carbs"
                                   , description: "\(appetizerDetails.carbs)   g")
                    DietDetailView(title: "Protein"
                                   , description: "\(appetizerDetails.protein)  g")
                }
            }
            
                
            
            Spacer()
            Button {
                order.add(appetizerDetails)
               isShowingDetailView = false
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
                    XButton()
                })
            }
    }
}

#Preview {
    AppetizerDetailView(appetizerDetails: MockData.sampleAppetizer, isShowingDetailView: .constant(true))
}

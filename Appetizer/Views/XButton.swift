//
//  XButton.swift
//  Appetizer
//
//  Created by Shiva on 9/11/24.
//

import SwiftUI

struct XButton: View {
    var body: some View {
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
    }
}

#Preview {
    XButton()
}

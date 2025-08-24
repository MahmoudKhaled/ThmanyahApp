//
//  HeaderView.swift
//  Home
//
//  Created by Mahmoud Khaled on 24/08/2025.
//
import SwiftUI

struct HeaderView: View {
    
    var searchHandler: (() -> Void)?

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "moonphase.waxing.gibbous")
                    .foregroundColor(.yellow)
                Text("Good evening  Mahmoud")
                    .foregroundColor(.white)
                    .font(.headline)
            }

            Spacer()

            ZStack(alignment: .topTrailing) {
                Button(action: {
                    searchHandler?()
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                })
            }
        }
        .padding()
    }
}
